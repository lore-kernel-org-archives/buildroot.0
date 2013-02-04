From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 00:09:07 +0100
Subject: [Buildroot] [PATCH] gdb: fixing gdb 7.4.1 build with eglibc-2_16
In-Reply-To: <1360011028-9946-2-git-send-email-c.schoenert@gmail.com> (Carsten
 Schoenert's message of "Mon, 4 Feb 2013 21:50:28 +0100")
References: <1360011028-9946-1-git-send-email-c.schoenert@gmail.com>
 <1360011028-9946-2-git-send-email-c.schoenert@gmail.com>
Message-ID: <87k3qny8vg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> gdb 7.4.1 fails with the following error
 Carsten>   gdb-7.4.1/gdb/linux-nat.h:79:18: error: field 'siginfo' has incomplete type
 Carsten> because gdb use 'struct siginfo' instead of 'struct siginfo_t'.
 Carsten> Crosstool-NG allready use the patches to prevent this error so use this
 Carsten> patches for buildroot too.

 Carsten> see also
 Carsten> http://permalink.gmane.org/gmane.comp.gcc.cross-compiling/15305

Committed, thanks.

-- 
Bye, Peter Korsgaard
