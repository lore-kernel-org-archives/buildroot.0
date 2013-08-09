From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Aug 2013 12:29:06 +0200
Subject: [Buildroot] [PATCH 3/3] ltrace: Fix "strndup not declared"
 build failure on powerpc/uclibc
In-Reply-To: <1376041019-26688-4-git-send-email-jezz@sysmic.org>
References: <1376041019-26688-1-git-send-email-jezz@sysmic.org>
 <1376041019-26688-4-git-send-email-jezz@sysmic.org>
Message-ID: <20130809122906.052d226a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Fri,  9 Aug 2013 11:36:59 +0200, J?r?me Pouiller wrote:
> On some systems, strndup is declared only if _GNU_SOURCE is defined
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Shouldn't this be globally defined by adding a -D_GNU_SOURCE to the
CFLAGS at the package level?

If not, then anyway your patch needs a Signed-off-by line, and should
be submitted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
