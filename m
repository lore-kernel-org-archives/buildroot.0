From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 13:27:40 +0200
Subject: [Buildroot] [PATCH 3/3] package/libuio: fix build with musl
In-Reply-To: <1467450008-27597-3-git-send-email-romain.naour@smile.fr> (Romain
 Naour's message of "Sat, 2 Jul 2016 11:00:08 +0200")
References: <1467450008-27597-1-git-send-email-romain.naour@smile.fr>
 <1467450008-27597-3-git-send-email-romain.naour@smile.fr>
Message-ID: <87twg88ekz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > limits.h header is missing in attr.c, base.c and helper.c to provide
 > PATH_MAX.

 > Fixes:
 > http://autobuild.buildroot.net/results/702/7023104e6018ea46c54073ddbe5119d0f66ae5a3

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
