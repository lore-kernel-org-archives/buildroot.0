From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Nov 2013 11:11:48 +0100
Subject: [Buildroot] running gtk programs fail
In-Reply-To: <527CB831.7060806@rosho.de>
References: <52330AFB.1050204@rosho.de>
	<527CB831.7060806@rosho.de>
Message-ID: <20131108111148.640ce383@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Bergmann,

On Fri, 08 Nov 2013 11:08:49 +0100, Frank Bergmann wrote:

> > Did I miss something or is libgtk broken ?
> 
> I did a step down and wrote a small glib program (in attachment). But
> it does not work in buildroot-2013.08.1 ! The glib main loop seems to
> get no events from timer nor from input source. On my host system the 
> program works with no issues.
> 
> Can anybody verify this behaviour or have a working example for me ?
> 
> In attachment I send the source of the test program and my buildroot
> config.

Are you testing against uClibc? If so, can you test against (e)glibc?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
