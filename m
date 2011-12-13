From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Dec 2011 18:30:02 +0100
Subject: [Buildroot] [PATCH] linux: support "local" as download method
In-Reply-To: <CAEvN+1hUU4Xd+BuMn+5DmdHAYx2Oue8QeruW50FLH0+LJ3PB2A@mail.gmail.com>
References: <1323255396-28263-1-git-send-email-tjlee@ambarella.com>
 <20111208223000.72d8e084@skate>
 <CAEvN+1hUU4Xd+BuMn+5DmdHAYx2Oue8QeruW50FLH0+LJ3PB2A@mail.gmail.com>
Message-ID: <201112131830.02660.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 09 December 2011 03:44:24 Tzu-Jung Lee wrote:
> > It's true that the Linux package is special in that it is very likely
> > that many people will want to use a local source directory, but I'm
> > fearing that we will end up adding many of those
> > "<something>_CUSTOM_LOCAL" option that just duplicate what is possible
> > thanks to the override source directory mechanism.
> 
> I tried both LINUX_OVERRIDE_SRCDIR and LINUX_CUSTOM_LOCAL, and sent the
> patch for the latter in case someone else might end up doing the same thing.

 You can actually achieve the same from the command line:

make LINUX_SITE=/... LINUX_SITE_METHOD=file linux

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
