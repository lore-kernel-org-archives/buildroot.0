From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Feb 2014 11:36:16 +0100
Subject: [Buildroot] [PATCH] qtuio: correct install-target/staging when
	Qt library type is 'static'
In-Reply-To: <2f31d28660bef7710aa8.1392630663@argentina> (Thomas De
 Schampheleire's message of "Mon, 17 Feb 2014 10:51:03 +0100")
References: <2f31d28660bef7710aa8.1392630663@argentina>
Message-ID: <87bny6hvq7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > If BR2_PACKAGE_QT_STATIC is set, qtuio will not build a .so file, but .a.
 > However, the custom INSTALL_TARGET_CMDS and INSTALL_STAGING_CMDS
 > unconditionally attempted to copy the .so file.

 > This commit checks the requested Qt library type and copies the right
 > library for each case, taking into account that the static .a file does not
 > need to be copied to the target directory.

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
