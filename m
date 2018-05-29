From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 May 2018 12:45:42 +0200
Subject: [Buildroot] [PATCH 6/8] ti-sgx-km: rename options to have
 proper prefix
In-Reply-To: <20180528204501.GL2965@scaer>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
 <20180513190737.26079-7-thomas.petazzoni@bootlin.com>
 <20180513193140.GJ22130@scaer> <e477cbd2-f662-b196-0c2c-f6959e42e983@mind.be>
 <20180516090052.21e0af47@windsurf>
 <fb6a5c78-7556-4110-b52b-ea6cef274c88@mind.be>
 <87wovwiuai.fsf@dell.be.48ers.dk>
 <4299684e-6356-dcf3-a35d-9fb9ef6606bb@mind.be> <20180528204501.GL2965@scaer>
Message-ID: <c932fafd-d7a1-9249-5d51-c6e4e7a45f0c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-05-18 22:45, Yann E. MORIN wrote:
> Arnout, Peter, All,
> 
> On 2018-05-22 12:42 +0200, Arnout Vandecappelle spake thusly:
>> On 21-05-18 23:16, Peter Korsgaard wrote:
>>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>>>
>>>  > On 16-05-18 09:00, Thomas Petazzoni wrote:
>>>  >> Hello,
>>>  >> 
>>>  >> On Tue, 15 May 2018 23:52:33 +0200, Arnout Vandecappelle wrote:
>>>  >> 
>>>  >>>> What is nice with this solution, is that we have the new choice that is
>>>  >>>> right near the legacy option so we can chek it, and it automatically
>>>  >>>> gets the old setting.
>>>  >>>> 
>>>  >>>> But I am not too convinced, however, because we do not usually use the
>>>  >>>> name of a choice elsewhere...  
>>>  >>> 
>>>  >>> Legacy is pretty special anyway. I do think it's worthwhile it to do this properly.
>>>  >>
>>>  >> Is this an Acked-by to the approach this patch series has taken in
>>>  >> terms of handling the Config.in choice option renaming ?
>>>
>>>  >  Er, no, it's a NACK. I *do* think it's worthwhile to properly select the new
>>>  > option.
> 
> Yeah, but as we've gone without support for legacy choices so far
> (almost 6 years now), I don't think this is an urgent matter.

 Excuse me? Have you read lines 19-59 of Config.in.legacy?

 Regards,
 Arnout

> 
> Next time, maybe I'll just shut up instead of suggesting sophisticated
> and imaginative solutions. ;-P
> 
> Regards,
> Yann E. MORIN.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
