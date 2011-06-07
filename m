From: Will Moore <will.moore@beraninstruments.com>
Date: Tue, 7 Jun 2011 15:28:25 +0100
Subject: [Buildroot] How do I configure crosstool-NG when built from in
	buildroot?`
Message-ID: <22B4F7B11BD34704A74C0E8AD60593AA@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am using buildroot2011.05 to build using crosstool-NG an i486 glibc toolchain.

The default crosstool-ng.config-glibc provided in buildroot builds glibc 2.9
against 2.6.38.4 kernel headers, I am "stuck" on 2.6.29.6 kernel as the latest
kernel supported by the SoC manufacturer.

On boot I get a "FATAL: kernel too old" on boot followed by a "Kernel panic -
not syncing: Attempted to kill init!" which I assume is because my kernel build
is too old for the glibc built by crosstool-NG.

What is the right way to reconfigure crosstool-NG when built from within
buildroot?

Regards,


Will
