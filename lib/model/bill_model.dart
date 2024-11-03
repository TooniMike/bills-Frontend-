class Bill {
  final int id;
  final String serviceName;
  final String logoUrl;
  final String lastPaidDate;
  final String nextDueDate;
  final double amountDue;
  final bool recurring;

  Bill({
    required this.id,
    required this.serviceName,
    required this.logoUrl,
    required this.lastPaidDate,
    required this.nextDueDate,
    required this.amountDue,
    required this.recurring,
  });

  // Factory constructor to create a Bill instance from JSON
  factory Bill.fromJson(Map<String, dynamic> json) {
    return Bill(
      id: json['id'],
      serviceName: json['service_name'],
      logoUrl: json['logo'],
      lastPaidDate: json['last_paid_date'],
      nextDueDate: json['next_due_date'],
      amountDue: double.parse(json['amount_due']),
      recurring: json['recurring'],
    );
  }
}
