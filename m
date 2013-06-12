From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Jun 2013 22:58:15 +0200
Subject: [Buildroot] Unable to open switchtest device
In-Reply-To: <D82259C7-D19C-4A4A-A5E6-E35B62A8F550@deadfrog.net>
References: <D82259C7-D19C-4A4A-A5E6-E35B62A8F550@deadfrog.net>
Message-ID: <51B8E0E7.4020705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/06/13 06:18, Ryan Wilkins wrote:
> Hi All.
>
> I'm fairly new to buildroot but do have it running on a x86 platform.  Buildroot release 2013.05.  I need Xenomai and have compiled in Xenomai 2.6.2.1 with Linux Kernel 3.5.7.  The processor is a Core 2 Quad and the kernel was initially compiled for x86_64 but recompiled for i386 with no change in outcome.  I am using a custom kernel configuration which is referenced in the buildroot "Kernel" configuration menu.
>
> The issue that I'm experiencing is with running the 'xeno-test' command and it failing with a "Unable to open switchtest device" message.  I've checked around in the archives and couldn't find anything that was useful to solving my situation.  Running the latency test command by itself works so I know Xenomai is working but it's just unable to complete the xeno-test commands.  Can anyone suggest some direction to look in to hopefully solve the issue with the switchtest device?

  There is probably some module that you need to load, and maybe there's 
something you need to configure in the Xenomai section of the kernel 
config. But this almost certainly has nothing to do with buildroot. You'd 
better consult the Xenomai website and ask on the Xenomai list.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
