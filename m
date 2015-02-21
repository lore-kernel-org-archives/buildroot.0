From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Feb 2015 16:00:56 +0100
Subject: [Buildroot] [PATCH] package/fltk: bump to 1.3.3
In-Reply-To: <1424530575-26287-1-git-send-email-romain.naour@openwide.fr>
References: <1424530575-26287-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150221160056.505d5f2f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 21 Feb 2015 15:56:15 +0100, Romain Naour wrote:
> In this release two dependencies on xlib_libXcursor
> and xlib_libXfixes have been added.
> 
> See http://www.fltk.org/articles.php?L1392
> 
> Also add hash file
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/fltk/fltk.hash |  4 ++++
>  package/fltk/fltk.mk   | 16 +++++++++++++++-
>  2 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 package/fltk/fltk.hash

Applied to next, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
