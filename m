From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 01 May 2014 23:36:38 +0200
Subject: [Buildroot] [PATCH] uclibc: re-add uclibc-update-config target
In-Reply-To: <ffb59038c33cd78676d8.1398885537@argentina> (Thomas De
 Schampheleire's message of "Wed, 30 Apr 2014 21:18:57 +0200")
References: <ffb59038c33cd78676d8.1398885537@argentina>
Message-ID: <87r44dqizd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > Commit a5e92d92e7ee413157aae7cecf1f354e718731e1 converted uClibc to the
 > package infrastructure, but while doing so removed support for the
 > documented uclibc-update-config make target. This make target copies the
 > uclibc .config file back to the original (typically version-controlled)
 > configuration file.

 > As this was an unintentional removal, this patch re-adds the
 > uclibc-update-config target.

 > Reported-by: Dan Moulding <dan.moulding@rackwareinc.com>
 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
