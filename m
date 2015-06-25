From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Jun 2015 01:08:27 +0200
Subject: [Buildroot] Problem with Touchscreen on ARM
In-Reply-To: <CALW-xeo1AEKxyX2u98w5qe7adphyj+MZ7Z4gezWYv1wtvjk4sg@mail.gmail.com>
References: <CALW-xeqpfVVYeff9+RPfhOhEEW3mohbqXEweXP7YQJuoYX1Erg@mail.gmail.com>
 <558B1E8D.9010106@mind.be>
 <CALW-xeo1AEKxyX2u98w5qe7adphyj+MZ7Z4gezWYv1wtvjk4sg@mail.gmail.com>
Message-ID: <558C89EB.8070807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/15 10:04, Guillaume s?tan wrote:
> 
> 
> 2015-06-24 23:18 GMT+02:00 Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>>:
> 
> On 06/24/15 16:23, Guillaume s?tan wrote:
> 
>>> Hello,
> 
>>>
> 
>> >I try to use a Touchscreen (multitouch) with my target (Arm Little endian -
> 
>>> Cortex - A9 ).
> 
>> >I tried to use EFL, directfb and fb but I haven't managed to run the multitouch
> 
>>> on my target.
> 
> 
>  >fb is just a framebuffer driver so doesn't have a relation with input events.
> 
> 
>  >directfb doesn't yet support multitouch AFAIK.
> 
> 
>  >EFL should support multitouch. But I guess you have to configure it to listen
>>to the right input device.
>  
>    How I can do that ? 

 I don't know, I never used enlightenment, but I expect they have some
documentation, no?


 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
