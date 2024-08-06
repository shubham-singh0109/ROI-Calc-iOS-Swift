import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ROICalculator()
                .tabItem {
                    Label("ROI Calculator", systemImage: "dollarsign.circle")
                }
            
            TaxCalculator()
                .tabItem {
                    Label("Tax Calculator", systemImage: "percent")
                }
        }
    }
}

struct ROICalculator: View {
    @State private var fixedAmount: String = ""
    @State private var interestRate: String = ""
    @State private var years: String = ""
    @State private var subtotal: Double = 0
    @State private var interestAmount: Double = 0
    @State private var total: Double = 0
    
    func calculateInterest() {
        let principal = Double(fixedAmount) ?? 0.0
        let rate = Double(interestRate) ?? 0.0
        let time = Double(years) ?? 0.0
        
        let interest = principal * (rate / 100) * time
        subtotal = principal
        interestAmount = interest
        total = principal + interest
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 20) {
                Text("ROI Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.blue)
                
                HStack {
                    Spacer()
                    Text("Fixed Amount ($):")
                        .font(.headline)
                        .padding()
                    TextField("Fixed Amount", text: $fixedAmount)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("Interest Rate (%):")
                        .font(.headline)
                        .padding()
                    TextField("Interest Rate", text: $interestRate)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("Years:")
                        .font(.headline)
                        .padding()
                    TextField("Years", text: $years)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    Spacer()
                }
                
                Button(action: calculateInterest) {
                    Text("Calculate")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Text("Subtotal ($): \(String(format: "%.2f", subtotal))")
                    .font(.title3)
                
                Text("Interest Amount ($): \(String(format: "%.2f", interestAmount))")
                    .font(.title3)
                
                Text("Total ($): \(String(format: "%.2f", total))")
                    .font(.title3)
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(15)
            .shadow(radius: 10)
        }
    }
}

struct TaxCalculator: View {
    @State private var laborCost: String = ""
    @State private var materialsCost: String = ""
    @State private var subTotal: Double = 0
    @State private var tax: Double = 0
    @State private var total: Double = 0
    private var interestRate: Double = 7.65

    func calculateSubTotal() {
        let labor = Double(laborCost) ?? 0.0
        let materials = Double(materialsCost) ?? 0.0
        subTotal = labor + materials
        tax = (interestRate / 100) * subTotal
        total = subTotal + tax
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 20) {
                Text("Tax Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(.blue)
                
                HStack {
                    Spacer()
                    Text("Product Cost ($):")
                        .font(.headline)
                        .padding()
                    TextField("Product Price", text: $laborCost)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    Spacer()
                }

                HStack {
                    Spacer()
                    Text("Additional Cost ($):")
                        .font(.headline)
                        .padding()
                    TextField("Additional Charge", text: $materialsCost)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                    Spacer()
                }

                Button(action: calculateSubTotal) {
                    Text("Calculate")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }

                Text("SubTotal ($): \(String(format: "%.2f", subTotal))")
                    .font(.title3)

                Text("Tax ($): \(String(format: "%.2f", tax))")
                    .font(.title3)

                Text("Total ($): \(String(format: "%.2f", total))")
                    .font(.title3)
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(15)
            .shadow(radius: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
