From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jun 2012 08:50:33 +0200
Subject: [Buildroot] [PATCH 0/3] Document use of local sources for
 packages
In-Reply-To: <1339970041-17398-1-git-send-email-ntl@pobox.com>
References: <1339970041-17398-1-git-send-email-ntl@pobox.com>
Message-ID: <20120618085033.6d612d8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 17 Jun 2012 16:53:58 -0500,
Nathan Lynch <ntl@pobox.com> a ?crit :

> Since the 2011.11 release Buildroot has supported building packages
> from local sources, but the manual has not reflected this well.  This
> series is an attempt to address that.  I relied on Thomas Petazzoni's
> description of the "file" and "local" methods here:
> 
> http://free-electrons.com/blog/buildroot-2011-11/
> 
> Nathan Lynch (3):
>   docs: update LIBFOO_SITE to describe use of filesystem paths
>   docs: rework LIBFOO_SITE_METHOD documentation
>   docs: describe "file" and "local" methods in LIBFOO_SITE_METHOD
> 
>  docs/manual/adding-packages-gentargets.txt |   77 +++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 25 deletions(-)

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

for the three patches.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
