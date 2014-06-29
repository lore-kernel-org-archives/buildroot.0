From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Jun 2014 12:05:49 +0200
Subject: [Buildroot] [PATCH 0 of 5 RFC] uclibc/busybox: fix handling of
 configuration file
In-Reply-To: <20140629102012.33364d0e@free-electrons.com>
References: <patchbomb.1403444739@localhost>	<53AA66F5.3090706@mind.be>	<CAAXf6LXoqTxwUj1VgqBrv=TWQ2vZ1gbm3wiCsqM8gfeyxxJ77Q@mail.gmail.com>	<CAAXf6LVC9vDUTiCmL0wGt4eHkeQYRO1CihoPJUx8eOzpf9keJQ@mail.gmail.com>
 <20140629102012.33364d0e@free-electrons.com>
Message-ID: <53AFE4FD.5080707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/06/14 10:20, Thomas Petazzoni wrote:
> Dear Thomas De Schampheleire,
> 
> On Sun, 29 Jun 2014 10:13:28 +0200, Thomas De Schampheleire wrote:
> 
>>> This sounds like a very interesting idea, I'll explore it further in
>>> the context of this patch series.
>>
>> I'm working on this now, but I wonder which is the right approach wrt
>> the organization of the patch series:
>>
>> - first line up linux, busybox, uclibc in the way they handle the
>> kconfig stuff, then extract this to a kconfig-package framework
>> - or first introduce a kconfig-package framework with the 'right'
>> handling, then convert each of linux, busybox, uclibc in subsequent
>> patches?
> 
> I'd say it doesn't matter that much. Maybe the first one allows more
> easily to see the functional changes that are made, by really I don't
> think it matter. At least on my end, I'd be happy with any of those two
> solutions.

 Same here. I had thought about it and found arguments for both options, so I
thought it better not to say anything :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
