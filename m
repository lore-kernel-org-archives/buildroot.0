From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 09:58:26 +0100
Subject: [Buildroot] [PATCH] package/qemu: fix crash with uClibc-ng
In-Reply-To: <20191019020928.2931-1-unixmania@gmail.com> (unixmania's message
 of "Fri, 18 Oct 2019 23:09:28 -0300")
References: <20191019020928.2931-1-unixmania@gmail.com>
Message-ID: <87lft24nkd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > On uClibc-ng sysconf(_SC_LEVEL1_{I,D}CACHE_LINESIZE) returns -1, which
 > is a valid result, meaning that the limit is indeterminate. Add a patch
 > that handles this situation using fallback values instead of crashing
 > due to an assertion failure.

 > Upstream status:
 >    https://lists.nongnu.org/archive/html/qemu-devel/2019-10/msg04115.html

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
