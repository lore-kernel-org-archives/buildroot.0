From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 11 Sep 2011 22:44:48 +0200
Subject: [Buildroot] [PATCH 1/3] samba: bump to version 3.5.10
In-Reply-To: <1312235564-31307-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Mon, 1 Aug 2011 23:52:44 +0200")
References: <1312235176-31058-1-git-send-email-s.neumann@raumfeld.com>
 <1312235564-31307-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <8739g2g667.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/samba/samba-CVE-2011-0719.patch            |  613 --------------------
 Sven>  package/samba/samba-add-check-for-__use_bsd.patch  |   18 -
 Sven>  .../samba/samba-do-not-check-glibc-version.patch   |  104 ----
 Sven>  package/samba/samba-fix-client-mtab.patch          |   11 -
 Sven>  package/samba/samba-fix-mount.cifs.patch           |   18 -
 Sven>  package/samba/samba-getgrouplist.patch             |   41 --
 Sven>  package/samba/samba-remove-legacy-index.patch      |    4 +-
 Sven>  package/samba/samba.mk                             |    4 +-
 Sven>  8 files changed, 4 insertions(+), 809 deletions(-)
 Sven>  delete mode 100644 package/samba/samba-CVE-2011-0719.patch
 Sven>  delete mode 100644 package/samba/samba-add-check-for-__use_bsd.patch
 Sven>  delete mode 100644 package/samba/samba-do-not-check-glibc-version.patch
 Sven>  delete mode 100644 package/samba/samba-fix-client-mtab.patch
 Sven>  delete mode 100644 package/samba/samba-fix-mount.cifs.patch
 Sven>  delete mode 100644 package/samba/samba-getgrouplist.patch

What version/tree is this against? When trying to commit I get:

Applying: samba: bump to version 3.5.10
error: package/samba/samba-CVE-2011-0719.patch: does not exist in index
error: patch failed: package/samba/samba.mk:3
error: package/samba/samba.mk: patch does not apply
Patch failed at 0001 samba: bump to version 3.5.10

We don't have a samba-CVE-2011-0719.patch file. Care to respin and
resend?

-- 
Bye, Peter Korsgaard
