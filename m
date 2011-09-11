From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Sep 2011 22:45:20 +0200
Subject: [Buildroot] [PATCH 2/3] samba: fix linking of smbd with avahi
	support
In-Reply-To: <1312235176-31058-3-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 1 Aug 2011 23:46:15 +0200")
References: <1312235176-31058-1-git-send-email-s.neumann@raumfeld.com>
 <1312235176-31058-3-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87y5xuerkv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Expliticly link with -lpthread if smbd is compiled with
 Sven> avahi support. Otherwise the binary will fail to run.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/samba/samba-fix-smbd-libs-avahi.patch |   11 +++++++++++
 Sven>  1 files changed, 11 insertions(+), 0 deletions(-)
 Sven>  create mode 100644 package/samba/samba-fix-smbd-libs-avahi.patch

 Sven> diff --git a/package/samba/samba-fix-smbd-libs-avahi.patch b/package/samba/samba-fix-smbd-libs-avahi.patch
 Sven> new file mode 100644
 Sven> index 0000000..c317b84
 Sven> --- /dev/null
 Sven> +++ b/package/samba/samba-fix-smbd-libs-avahi.patch
 Sven> @@ -0,0 +1,11 @@

Please add the same description / signed-off-by in the patch header.

-- 
Bye, Peter Korsgaard
