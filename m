From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 13:26:05 +0200
Subject: [Buildroot] [PATCH 1/3] package/libuio: fix build with external
	intl library
In-Reply-To: <1467450008-27597-1-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Sat, 2 Jul 2016 11:00:06 +0200")
References: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
Message-ID: <8737ns9t82.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When intl library is not provided by the libc, libuio forget to link
 > with -lintl.

 > Fixes:
 > http://autobuild.buildroot.net/results/8f7/8f715b4e9b826dac13f3d49da25576e6e1d79449

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed after simplifying as suggested by Yann, thanks.

-- 
Bye, Peter Korsgaard
