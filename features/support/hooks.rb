Before do
  File.open("#{File.dirname(__FILE__)}/temperature.json", 'w') do |file|
    file.write <<CONTENT
{
    "probes": {
        "sonda_1": {
            "name": "Sonda 1",
            "temperatures": {
                "min": "1.0",
                "max": "2.0"
            }
        },
        "sonda_2": {
            "name": "Sonda 2",
            "temperatures": {
                "min": "3.0",
                "max": "4.0"
            }
        },
        "sonda_3": {
            "name": "Sonda 3",
            "temperatures": {
                "min": "5.0",
                "max": "6.0"
            }
        }
    },
    "emails": [
        "pippo1@tin.it",
        "pippo2@tin.it",
        "pippo3@tin.it"
    ]
}
CONTENT
  end
end