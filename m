From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Apr 2015 23:13:10 +0200
Subject: [Buildroot] [PATCH] sh64: drop support for architecture
In-Reply-To: <20150409192212.GB27057@waldemar-brodkorb.de>
References: <20150407203101.GA14853@waldemar-brodkorb.de>
 <20150408225336.0b046dac@free-electrons.com>
 <20150409192212.GB27057@waldemar-brodkorb.de>
Message-ID: <55283CE6.2080707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/15 21:22, Waldemar Brodkorb wrote:
> Hi Thomas,
> Thomas Petazzoni wrote,
> 
>> Dear Waldemar Brodkorb,
>>
>> On Tue, 7 Apr 2015 22:31:01 +0200, Waldemar Brodkorb wrote:
>>> There seems to be no hardware or emulator available for this
>>> architecture. Someone from ST Microelectronics told me that
>>> sh64/sh5 projects are dropped over ten years ago.
>>> I found nothing about real hardware on the sites of Hitachi
>>> or Renesas.
>>> We should drop this.
>>> Support in uClibc-ng will be dropped in 1.1.
>>>
>>> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
>>
>> Following my and Peter comments, we'd prefer to see this feature to be
>> marked as deprecated. I've marked the patch as "Rejected" in patchwork.
>> Can you cook a patch simply marking sh64 as deprecated?
> 
> Is there documentation how to do this?

 Just add

	depends on BR2_DEPRECATED_SINCE_2015_05

(check 'git log -p --grep deprecate' for examples)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
