xml.instruct! :xml, version: "1.0", encoding: "UTF-8"
xml.rss :version => "2.0", :"xmlns:itunes" => "http://www.itunes.com/dtds/podcast-1.0.dtd", :"xmlns:atom" => "http://www.w3.org/2005/Atom" do
  xml.channel do
    xml.title "Fork & Pull"
    xml.description "Bit-sized screencasts on open source software"
    xml.link "#{request.protocol}#{request.host_with_port}"

    xml.tag!("atom:link", :href => "#{request.protocol}#{request.host_with_port}/videos.rss", :rel => "self", :type => "application/rss+xml")
    xml.tag!("itunes:name", "Jonathan Mumm")

    @videos.each do |video|
      xml.item do
        xml.title video.title
        xml.tag!("itunes:author", "Jonathan Mumm")
        xml.description video.description
        xml.pubDate
      end
    end

  end
end
