From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 04 Jul 2014 15:57:48 +0200
Subject: [Buildroot] [PATCH v2] infra: /usr support: STAGING_DIR can be
	outside BASE_DIR
In-Reply-To: <a6e2d2ad27e8a662e8db.1404417523@localhost> (Thomas De
 Schampheleire's message of "Thu, 03 Jul 2014 21:58:43 +0200")
References: <a6e2d2ad27e8a662e8db.1404417523@localhost>
Message-ID: <87y4w95iqr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > If the user sets a custom BR2_HOST_DIR, then STAGING_DIR is not under
 > BASE_DIR. The .pc/.la file fixup commands incorrectly made this assumption
 > and thus should be corrected.

 > Additionally, this patch:
 > - rewords the comment in pkg-autotools that explains the replacements.
 > - removes a for statement in favor of xargs

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v2:
 > - update commit message with for->xargs change (Arnout)
 > - apply fix to qt5.mk (Arnout)
 > - fix bad change in pkg-generic.mk (missing @)

Committed, thanks.

-- 
Bye, Peter Korsgaard
