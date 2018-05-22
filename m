From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 22 May 2018 12:42:13 +0200
Subject: [Buildroot] [PATCH 6/8] ti-sgx-km: rename options to have
 proper prefix
In-Reply-To: <87wovwiuai.fsf@dell.be.48ers.dk>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
 <20180513190737.26079-7-thomas.petazzoni@bootlin.com>
 <20180513193140.GJ22130@scaer> <e477cbd2-f662-b196-0c2c-f6959e42e983@mind.be>
 <20180516090052.21e0af47@windsurf>
 <fb6a5c78-7556-4110-b52b-ea6cef274c88@mind.be>
 <87wovwiuai.fsf@dell.be.48ers.dk>
Message-ID: <4299684e-6356-dcf3-a35d-9fb9ef6606bb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-05-18 23:16, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 16-05-18 09:00, Thomas Petazzoni wrote:
>  >> Hello,
>  >> 
>  >> On Tue, 15 May 2018 23:52:33 +0200, Arnout Vandecappelle wrote:
>  >> 
>  >>>> What is nice with this solution, is that we have the new choice that is
>  >>>> right near the legacy option so we can chek it, and it automatically
>  >>>> gets the old setting.
>  >>>> 
>  >>>> But I am not too convinced, however, because we do not usually use the
>  >>>> name of a choice elsewhere...  
>  >>> 
>  >>> Legacy is pretty special anyway. I do think it's worthwhile it to do this properly.
>  >> 
>  >> Is this an Acked-by to the approach this patch series has taken in
>  >> terms of handling the Config.in choice option renaming ?
> 
>  >  Er, no, it's a NACK. I *do* think it's worthwhile to properly select the new
>  > option.
> 
> OK. I would like to release RC2 and include these renames, so how about
> you send a followup series with the reworked Config.in.legacy handling?

 At the pace that I've been active in Buildroot lately, not likely, but I'll
give it a shot :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
