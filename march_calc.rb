#This program calculates the number of each tier of troops to send, accounting for up to t8s.
#
@march_cap = 0
@max_tier = ''


#Below are the ratios used to calculate each tier, adjust if needed or desired.
@t8_infantry = {
  :t1 => 0.005,
  :t2 => 0.005,
  :t3 => 0.005,
  :t4 => 0.005,
  :t5 => 0.011,
  :t6 => 0.012,
  :t7 => 0.022,
  :t8 => 0.035
}

@t8_cavalry = {
  :t1 => 0.005,
  :t2 => 0.005,
  :t3 => 0.006,
  :t4 => 0.012,
  :t5 => 0.051,
  :t6 => 0.035,
  :t7 => 0.068,
  :t8 => 0.068
}

@t8_bowmen = {
  :t1 => 0.021,
  :t2 => 0.021,
  :t3 => 0.031,
  :t4 => 0.031,
  :t5 => 0.058,
  :t6 => 0.148,
  :t7 => 0.102,
  :t8 => 0.238
}

@t7_infantry = {
  :t1 => 0.005,
  :t2 => 0.005,
  :t3 => 0.017,
  :t4 => 0.017,
  :t5 => 0.012,
  :t6 => 0.022,
  :t7 => 0.022
}


@t7_cavalry = {
  :t1 => 0.005,
  :t2 => 0.005,
  :t3 => 0.028,
  :t4 => 0.025,
  :t5 => 0.051,
  :t6 => 0.068,
  :t7 => 0.068
}


@t7_bowmen = {
  :t1 => 0.01,
  :t2 => 0.01,
  :t3 => 0.056,
  :t4 => 0.112,
  :t5 => 0.069,
  :t6 => 0.157,
  :t7 => 0.236
}




#Initial input prompt
def input
  puts "Enter your march capacity: "
  @march_cap = gets.chomp.to_i

  puts "Enter max troop tier (suports t7 and t8): "
  @max_tier = gets.chomp.downcase
end

#Prompt user to continue calculation, or exit instead
def prompt_exit
    puts 'Would you like to perform another calculation? (Y/N): '
    ans = gets.chomp.downcase
    if ans == 'y' || ans == 'yes'
        input
        calc_res
    else
      puts 'Exiting...'
    end
end


#Calculates infantry count
def calc_inf

  inf = []

  if @max_tier == 't7' || @max_tier == '7'
    hash = @t7_infantry
  else
    hash = @t8_infantry
  end

  hash.each { |key, value|

    troop_cnt = @march_cap * value
    troop_cnt = troop_cnt.to_i
    res_pair = [key.to_s, troop_cnt]
    inf << res_pair
  }
  inf
end

#Calculates cavalry count
def calc_cav

  cav = []

  if @max_tier == 't7' || @max_tier == '7'
    hash = @t7_cavalry
  else
    hash = @t8_cavalry
  end

  hash.each {|key, value|
    troop_cnt = @march_cap * value
    troop_cnt = troop_cnt.to_i
    res_pair = [key, troop_cnt]
    cav << res_pair
  }
  cav
end

#Calculates bowmen count
def calc_bow

  bow = []

  if @max_tier == 't7' || @max_tier == '7'
    hash = @t7_bowmen
  else
    hash = @t8_bowmen
  end


  hash.each {|key, value|
    troop_cnt = @march_cap * value
    troop_cnt = troop_cnt.to_i
    res_pair = [key, troop_cnt]
    bow << res_pair
  }
  bow
end


#Output results in a semi-decent looking fashion
def calc_res

  inf = calc_inf
  cav = calc_cav
  bow = calc_bow



  bow.each do |pair|
    puts "#{pair[0]} bowmen: #{pair[1]}"
  end

  cav.each do |pair|
    puts "#{pair[0]} cavalry: #{pair[1]}"
  end

  inf.each do |pair|
    puts "#{pair[0]} infantry: #{pair[1]}"
  end
end


input
calc_res
prompt_exit
