module ApplicationHelper
    #splat operator (*) means that any argument passed from this point will be
    #available inside the method as an array
    def title(*parts)
        unless parts.empty?
            content_for :title do
                (parts << "Ticketee").join(" - ")
            end
        end
    end
end
