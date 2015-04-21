From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 21 Apr 2015 23:59:02 +0200
Subject: [Buildroot] [PATCH] rtai: remove option
 BR2_LINUX_KERNEL_EXT_RTAI_PATCH
In-Reply-To: <20150421234737.03dbb086@free-electrons.com>
References: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>	<5536C4ED.3010008@mind.be>
 <20150421234737.03dbb086@free-electrons.com>
Message-ID: <5536C826.8080904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/04/15 23:47, Thomas Petazzoni wrote:
> Arnout,
> 
> On Tue, 21 Apr 2015 23:45:17 +0200, Arnout Vandecappelle wrote:
> 
>>  This requires legacy handling. With in the help text something like
>>
>> 	  The BR2_LINUX_KERNEL_EXT_RTAI_PATCH option never worked, so it is
>> 	  probably not useful. If you do have a valid use case and it used to
>> 	  work for you, please let us know on buildroot at buildroot.net.
> 
> Well, I talked about Config.in.legacy handling in the commit message:

 TL;DR :-)

> 
> """
> Bottom line is that this feature has never worked, so there is not
> even a point in adding Config.in.legacy support for it.
> """
> 
> Should I understand that you don't agree with this reasoning, and still
> want Config.in.legacy handling?

 Yep, because if someone _does_ have it set, it probably works for them and we
should know about it. If nobody has it set, then it doesn't hurt to have it in
legacy.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
