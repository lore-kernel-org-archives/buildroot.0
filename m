From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 14:13:09 +0200
Subject: [Buildroot] [PATCH 5/6] package/gcc: remove gcc 4.9
In-Reply-To: <20190802130937.12591-5-romain.naour@smile.fr> (Romain Naour's
 message of "Fri, 2 Aug 2019 15:09:35 +0200")
References: <20190802130937.12591-1-romain.naour@smile.fr>
 <20190802130937.12591-5-romain.naour@smile.fr>
Message-ID: <87tvax163u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > In order to reduce the number of choice in gcc selection, remove the
 > gcc 4.9 version.

 > This version was kept due to libstdc++ ABI-incompatible changes and
 > other build issues with kernel and bootloader as reported by Arnout
 > [1].

 > Since then, gcc 4.9 is not supported any more since glibc 2.29 [2]
 > and recent kernel and bootloaders has been fixed to use more recent
 > compiler version.

 > [1] http://lists.busybox.net/pipermail/buildroot/2017-June/194374.html
 > [2] https://www.sourceware.org/ml/libc-alpha/2019-01/msg00723.html

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
