From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Apr 2013 21:22:32 +0200
Subject: [Buildroot] xconfig "Save As" behavior
In-Reply-To: <517C387B.80205@ras.kells.com> (Rob Schottland's message of "Sat, 
 27 Apr 2013 13:43:39 -0700")
References: <517C387B.80205@ras.kells.com>
Message-ID: <874neq5ukn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Rob" == Rob Schottland (buildroot) <arm@ras.kells.com> writes:

 Rob> In buildroot-2013.02 "make xconfig", I have found that the "Save As"
 Rob> option from the File menu ignores the filename and directory entered
 Rob> and saves instead to the original .config file, reporting
 Rob> #
 Rob> # configuration written to  {buildroot install directory}/.config
 Rob> #

 Rob> Has this been reported previously?

Not that I'm aware of.

I just checked, and it is still behaving like that in current git. As
you might know, we're using kconfig from the Linux kernel, so I checked
there (3.9-rc8), and it also behaves like that.

With other words, the bug is not caused by the buildroot integration.

Yann, any ideas how to fix this?

 Rob> in "make menuconfig" the "save as" feature works as it should.

-- 
Bye, Peter Korsgaard
