From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2008 14:55:55 +0100
Subject: [Buildroot] How to build a gcc-3.3 toolchain
In-Reply-To: <1225463596.29685.1282290569@webmail.messagingengine.com> (Adam
	McLaurin's message of "Fri\, 31 Oct 2008 10\:33\:16 -0400")
References: <1225463596.29685.1282290569@webmail.messagingengine.com>
Message-ID: <87ej1uz0yc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam McLaurin <buildroot@irotas.net> writes:

 Adam> Hi folks,
 Adam> Unfortunately the software project I'm working on requires some features
 Adam> of gcc that were removed after v3.3.x. However, when I do 'make
 Adam> menuconfig' for buildroot and go to select the version of gcc, the only
 Adam> versions available are 4.1.2, 4.2.1, 4.2.3, 4.2.4, and 4.3.1.

 Adam> Is it possible to install an older version instead, perhaps 3.3.6?

You could probably change the existing 3.4.6 support (remember to
enable BR2_DEPRECATED) to compile a 3.3 gcc instead.

-- 
Bye, Peter Korsgaard
