From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 02 Sep 2013 17:42:15 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx.mk typo corrected
In-Reply-To: <5224AC58.6050001@martin.creutziger.net> (Martin Creutziger's
 message of "Mon, 02 Sep 2013 17:18:48 +0200")
References: <5224AC58.6050001@martin.creutziger.net>
Message-ID: <87d2orb57s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Creutziger <buildroot@martin.creutziger.net> writes:

 Martin> There is a simple typo in package/ti-gfx/ti-gfx.mk, which the
 Martin> following patch corrects:

 Martin> Signed-off-by: Martin Creutziger <buildroot@martin.creutziger.net>
 Martin> ---
 Martin> Index: package/ti-gfx/ti-gfx.mk
 Martin> ===================================================================
 Martin> --- package/ti-gfx/ti-gfx.mk	(revision 14043)
 Martin> +++ package/ti-gfx/ti-gfx.mk	(working copy)

Committed, thanks.

In the future, please consider creating the patch using git so it can be
directly committed with git am (or atleast add one more directory level,
as git am expects patch -p1 format).

-- 
Bye, Peter Korsgaard
