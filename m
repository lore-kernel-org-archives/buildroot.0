From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Aug 2011 09:02:47 +0200
Subject: [Buildroot] [PATCH 1/2] syslinux: bump version and fix build
In-Reply-To: <87hb4yobcb.fsf@macbook.be.48ers.dk>
References: <1314721730-8241-1-git-send-email-arnout@mind.be>
 <201108302033.21764.arnout@mind.be> <87hb4yobcb.fsf@macbook.be.48ers.dk>
Message-ID: <201108310902.49418.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On Tuesday 30 August 2011 23:09:40, Peter Korsgaard wrote:
> Your commit message mentions 'fix build' - Is this something needed for
> 2011.08, E.G. does the current syslinux version not build for you?

 No, it's a build problem of syslinux 4.04.  I've clarified that in the commit 
message.  There's a comment in the patch explaining the problem: 

# syslinux-4.04 comes with a bundled mk-lba-img executable which
# may not work in our host environment.

 [Actually, now I look at it again, it's a bit of a coincidence that it works 
for the other bundled executables.  Perhaps we should do a make clean before 
building instead...]

>  Arnout> Do I need to resend?
> 
> Preferably yes.

 Coming up...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
