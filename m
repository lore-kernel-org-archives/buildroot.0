From: Jaap Crezee <jaap@jcz.nl>
Date: Sat, 30 May 2015 13:49:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/ncurses: Fix GCC 5.x
 preprocessor failure
In-Reply-To: <1432770713-18309-1-git-send-email-rdkehn@yahoo.com>
References: <1432770713-18309-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <5569A3BB.2070502@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/15 01:51, Doug Kehn wrote:
> Building ncurses 5.9 with GCC 5.x fails with a syntax error, caused by
> earlier preprocessing. This failure is more likely when building for
> host (e.g. host-ncurses) that recently updated to GCC 5.x.
> 
> This patch is taken from the following link (more information is also
> available here):
> https://groups.google.com/forum/#!topic/sage-trac/U31shviuqzk
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

Acked-by: Jaap Crezee <jaap@jcz.nl>
Tested-by: Jaap Crezee <jaap@jcz.nl>

This patch works for me on my Archlinux updated system (gcc 5.1.0)

Regards,

Jaap Crezee
