From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Aug 2009 00:40:46 +0200
Subject: [Buildroot] rebuild problem, fakeroot complaining.
In-Reply-To: <d6cda7730908211112v7b6aa889wc84577d912cb976c@mail.gmail.com>
References: <35d32c5c0908210201p60633a21k4762f67e0d98762e@mail.gmail.com>
	<d6cda7730908211112v7b6aa889wc84577d912cb976c@mail.gmail.com>
Message-ID: <20090822004046.2dfde2a3@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 21 Aug 2009 15:12:18 -0300,
Thiago A. Corr?a <thiago.correa@gmail.com> a ?crit :

> I've never seen this, but from the error message, looks like the linux
> kernel on your host computer lacks SYSV IPC support. Try enabling it,
> should fix the problem. You would have to recompile your kernel, or do
> some distro wizardry to get the right precompiled kernel package.

That's also what I would have said, but Richard reports in its original
e-mail: "If i reboot then i can build again one time but the next
fails.".

So it looks like fakeroot works once, and then the next times fails.
Maybe fakeroot only uses SysV IPC in some cases, but that seems odd.

I've also never seen such a report.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
