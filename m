From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 21 Nov 2012 11:11:00 +0100
Subject: [Buildroot] [PATCH 1/3] xtensa: use uppercase for
	configurations and modofied overlay structure
In-Reply-To: <50ac8f31.4b53440a.7e28.05ed@mx.google.com> (Chris Zankel's
 message of "Tue, 20 Nov 2012 10:31:36 -0800")
References: <50ac8f31.4b53440a.7e28.05ed@mx.google.com>
Message-ID: <87obiri7uz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Zankel <chris@zankel.net> writes:

 Chris> Except for architecture and processor names, buildroot uses capitalized
 Chris> configuration names, so change the macro names for xtensa to follow that
 Chris> standard.
 Chris> Change the overlay file to have a subdirectory for each component
 Chris> (gdb, binutils, gcc, etc.) to make it more future-prove.

Committed, thanks.

-- 
Bye, Peter Korsgaard
