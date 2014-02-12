From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Feb 2014 20:27:58 +0100
Subject: [Buildroot] [PATCH] package/elfutils: disable for avr32
In-Reply-To: <1392226443-10660-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Wed, 12 Feb 2014 18:34:03 +0100")
References: <1392226443-10660-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87ob2crv0h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Disable elfutils for avr32, because:
 >   - elfutils uses canonicalize_file_name, which came after uClibc-0.9.31.
 >   - avr32 uses a toolchain with uClibc-0.9.31

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
