From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Apr 2015 11:05:08 +0200
Subject: [Buildroot] [git commit] ipmiutil: only make available for x86
In-Reply-To: <20150404224203.64C81818DE@busybox.osuosl.org>
References: <20150404224203.64C81818DE@busybox.osuosl.org>
Message-ID: <20150405110508.6077a06a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 5 Apr 2015 00:41:32 +0200, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=9b38f10c074be00c9bcc90330ce302f3b41d6b2f
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> IPMI is a Intel/PC spec, so it doesn't make much sense to build on !x86 -
> And ipmiutil uses sys/io.h and inb()/outb() which isn't supported on all
> architectures, so limit to x86 like we do for acpid.

It actually does build fine on ARM, though I agree it probably doesn't
make a lot of sense to have ipmiutil on something else than x86/x86-64.

Thanks for fixing this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
