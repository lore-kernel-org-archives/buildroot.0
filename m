From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 May 2015 10:53:18 +0200
Subject: [Buildroot] [PATCH] uclibc-ng/uclibc: enable context functions
In-Reply-To: <20150511081234.GA20953@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Mon, 11 May 2015 10:12:34 +0200")
References: <20150511081234.GA20953@waldemar-brodkorb.de>
Message-ID: <87y4kvijgh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > For mongrel2/libsigsegv we need to enable this in the uClibc-ng/uClibc-snapshot config.
 > Tested with ARM:

 > file output/target/usr/bin/mongrel2
 > output/target/usr/bin/mongrel2: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically linked (uses shared libs), stripped

 > Should fix:
 > http://autobuild.buildroot.net/results/a144bc6024415a5272c3cbe60ff636d078d0a555/
 > http://autobuild.buildroot.net/results/00195d89a115a314bf4916af127407f61cd1b418/
 > http://autobuild.buildroot.net/results/5ee7e83ebcfa43f6ee0a2a8b9f40f1ae84664aca/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v2:
 >   - add to uClibc-snapshot as requested by Thomas Petazzoni

Committed, thanks.

-- 
Bye, Peter Korsgaard
