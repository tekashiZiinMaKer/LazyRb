# Variáveis de corss.
Vermelho="\033[1;31m";Azul="\033[1;34m";Branco="\033[1;37m";Verde="\033[1;32m"

def back
    printf "Aperte a tecla enter para voltar ao menu...".colorize(:color => :light_blue)
    
    input = gets.chomp
end 


def consumo(url)
    begin
        json = JSON.parse(RestClient.get(url).body)

        json.each do |key,value|

            puts '%s => %s'%[key,value]
        end

        back

    rescue SocketError
        puts '[*] Sem conexão com a Internet'.colorize(:color => :light_blue)
        back 

    rescue => exception
        puts '[!] Nada encontrado....'.colorize(:color => :red)

       back    
    end
end 



while true do

    system('clear')
     
    system ('toilet -f smblock --filter border:metal "tekashi Consultas" ')

    puts '
    [*] --- https://github.com/tekashiZiinMaKer --- [*]
    '.colorize(:color => :light_blue) 
puts'======================='.colorize(:color => :light_blue) 
print"{branco}[{verde} 1 {branco}] Consulta CEP"
puts'[ 2 ] Consulta DDD
[ 3 ] Consulta IP
[ 4 ] Consulta CNPJ'
puts'===================='.colorize(:color => :light_blue)

    printf'
    -->> '.colorize(:color => :cyan)

    user = gets.chomp.to_i

    case user

    when 1
        printf 'Informe o CEP: '.colorize(:color => :cyan)
        cep = gets.chomp.to_i
    
        url = 'https://viacep.com.br/ws/%s/json/'%[cep]
        consumo(url)


    when 2
        printf 'Informe o DDD: '.colorize(:color => :cyan)
        ddd = gets.chomp.to_i

        url = 'https://brasilapi.com.br/api/ddd/v1/%s'%[ddd]
        consumo(url)
    
    when 3
        printf 'Informe o IP: '.colorize(:color => :cyan)
        ip = gets.chomp.to_f

        url = 'https://ipwhois.app/json/%s'%[ip]
        consumo(url)
      
    when 4
        printf 'Informe o CNPJ: '.colorize(:color => :cyan)
        cnpj = gets().to_i
        
        url = 'https://www.receitaws.com.br/v1/cnpj/%s'%[cnpj]
        consumo(url)
      

    end 
end

BEGIN { require 'json'; require 'colorize'; require 'rest-client' } 
