From: JNY <jny0@hotmail.com>
Date: Sat, 21 Aug 2010 05:18:55 -0700 (PDT)
Subject: [Buildroot] How to get gdb in the image
In-Reply-To: <29497355.post@talk.nabble.com>
References: <29492552.post@talk.nabble.com> <20100820191257.61821f87@surf>
	<29497355.post@talk.nabble.com>
Message-ID: <29497556.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Since adding gdb to the menuconfig, buildroot no longer makes.  I get the
following errors and warnings: 

Hi,

I managed to get around the previous error by removing the linux config, and
using the default settings.  The toolchain still seems to work (so I assume
the linux config was probably default anyway), but still having problems
with gdb however.  A gdbserver directory has appeared in the output->build
directory, which I copoed to the target, but when I run it, I'm told
"Permissions Denied".
-- 
View this message in context: http://old.nabble.com/How-to-get-gdb-in-the-image-tp29492552p29497556.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
