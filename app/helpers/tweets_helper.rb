module TweetsHelper
  def linked_users(content)
      
       whatever = content.gsub /@([\w]+)/ do |match|
        switched = match.gsub(/@/,"")   
        link_to match, get_profile_path(switched), class: "ats"
       end
       whatever.html_safe
       
       
  end
  
  def parse(content)
    
    regex = SimpleHashtag::Hashtag::HASHTAG_REGEX
    content = content.to_s.gsub(regex) do
      link_to($&, hashtag_path($2), {class: "hashtag"})
    end.html_safe

    content.gsub /@([\w]+)/ do |match|
    switched = match.gsub(/@/,"")   
    link_to match, get_profile_path(switched), class: "ats"
    end.html_safe

  end
end
