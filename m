From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:01:47 +0200
Subject: [Buildroot] [PATCH] package/gnutls: Fix build with uClibc
In-Reply-To: <20200623101533.1459806-1-stefan.sorensen@spectralink.com>
 (stefan's message of "Tue, 23 Jun 2020 12:15:33 +0200")
References: <20200623101533.1459806-1-stefan.sorensen@spectralink.com>
Message-ID: <87tuy7v6zo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "stefan" == stefan  <stefan@astylos.dk> writes:

 > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
 > Since v3.6.14 gnutls wants to use the 'e' flag with fopen to set the
 > O_CLOEXEC flags. Since this is a glibc extension, it will trigger a
 > gnulib override of fopen on non-glibc systems, but that override
 > breaks the uClibc stdio.h header.

 > Fixes:
 > http://autobuild.buildroot.org/results/02f/02f2b524add307c8f7cc1af1ed0783bb1baf029a

 > Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
