From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 May 2013 09:25:51 -0300
Subject: [Buildroot] [PATCH] poco: not available for all architectures
In-Reply-To: <20130516142325.5afc5306@skate>
References: <1368704401-1832-1-git-send-email-gustavo@zacarias.com.ar>
 <20130516115453.GF4709@tarshish> <5194CAB9.8020102@zacarias.com.ar>
 <20130516142325.5afc5306@skate>
Message-ID: <5194D04F.7050406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/16/2013 09:23 AM, Thomas Petazzoni wrote:

>> I'm actually disabling the comment if it's not a supported architecture
>> with that line (same as the option itself).
> 
> I believe that what Baruch says is that the comment is useless when
> you're on an architecture that poco doesn't support.
> 
> So it should actually be:
> 
> 	depends on (BR2_aarch64 || BR2_arc || BR2_bfin || BR2_microblaze || BR2_mipsel || BR2_xtensa)
> 
> No?

Maybe it's because i'm out of coffee, but i don't see that holding.
So comment "hey you lack toolchain X" when ARCH = aarch64 || arc .. ?
So it shows up if any of those arches == true ?
Regards.
