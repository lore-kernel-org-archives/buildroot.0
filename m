From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Dec 2011 23:41:57 +0100
Subject: [Buildroot] [PATCH 1/3] libffi: remove invalid variable
	'includedir' in .pc file
In-Reply-To: <1323171959-24873-2-git-send-email-zonque@gmail.com> (Daniel
 Mack's message of "Tue, 6 Dec 2011 12:45:57 +0100")
References: <1323171959-24873-1-git-send-email-zonque@gmail.com>
 <1323171959-24873-2-git-send-email-zonque@gmail.com>
Message-ID: <87zkeyafyi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:

 Daniel> Fixes the following error:
 Daniel>   Variable 'includedir' not defined in '/home/daniel/buildroot/output/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/lib/pkgconfig/libffi.pc'

Committed, thanks.

-- 
Bye, Peter Korsgaard
