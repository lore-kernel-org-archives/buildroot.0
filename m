From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 21 Sep 2009 21:23:58 +0200
Subject: [Buildroot] [PATCH] samba: fix dependencies
In-Reply-To: <1253550113-31475-1-git-send-email-s.neumann@raumfeld.com> (Sven
	Neumann's message of "Mon\, 21 Sep 2009 18\:21\:53 +0200")
References: <1253550113-31475-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87bpl4umnl.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> The samba configure scripts detects the presence of fam and avahi
 Sven> headers in order to decide whether support for fam and/or avahi should
 Sven> be built into samba. This patch adds the missing dependencies so that
 Sven> fam and/or avahi are built before samba if they are selected in buildroot.

Thanks, but it doesn't apply (which is slightly odd as your patches are
the only thing changing samba.mk in 2009). Could you recreate against
git please?

git am -3 -s /tmp/samba.patch
Applying: samba: fix dependencies
error: patch failed: package/samba/samba.mk:11
error: package/samba/samba.mk: patch does not apply
fatal: sha1 information is lacking or useless (package/samba/samba.mk).
Repository lacks necessary blobs to fall back on 3-way merge.
Cannot fall back to three-way merge.
Patch failed at 0001 samba: fix dependencies
When you have resolved this problem run "git am -3 --resolved".
If you would prefer to skip this patch, instead run "git am -3 --skip".
To restore the original branch and stop patching run "git am -3 --abort"

-- 
Bye, Peter Korsgaard
