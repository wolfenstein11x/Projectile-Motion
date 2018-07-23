#make it so that when it outputs big numbers, it puts a comma between 3 zeroes

include Math 

class Projectile
  def initialize(h0, v0, a)
    @h0 = h0*1.0
    @v0 = v0*1.0 
    @a = a*(3.14159265359/180.0)
  end

  def height_eq
    b = (@v0*Math.sin(@a)).round(3) 
    b_str = b.to_s
    if @h0 != 0
      return "h(t) = -16.0t^2 + #{b_str}t + #{@h0}"
    elsif @h0 == 0 
      return "h(t) = -16.0t^2 + #{b_str}t"
    end 
  end

  def horiz_eq
    b = (@v0 * Math.cos(@a)).round(3)
    b_str = b.to_s
    return "s(t) = #{b_str}t"
  end  

  def height(t)
    return (-16.0*(t**2) + (@v0*sin(@a))*t + @h0).round(3)
  end

  def horiz(t)
    return ((@v0*cos(@a))*t).round(3)
  end 

  def landing
    t_ground = (-1.0*@v0*Math.sin(@a) - Math.sqrt((@v0*sin(@a))**2 - 4.0*(-16.0)*@h0))/(-32.0)

    return [((@v0*Math.cos(@a)*t_ground).round(3)).to_s + " feet", 0, (t_ground.round(3)).to_s + " seconds"]
  end 

end

print "Enter the initial height, in feet: "
height_str = gets.strip
height = height_str.to_f
print "Enter the initial velocity, in feet per second: "
velocity_str = gets.strip
velocity = velocity_str.to_f
print "Enter the launch angle, in degrees: "
angle_str = gets.strip
angle = angle_str.to_f

proj1 = Projectile.new(height, velocity, angle)
puts ""
puts proj1.height_eq
puts proj1.horiz_eq 
puts "Landing distance, landing height, and landing time, respectively: "
puts proj1.landing