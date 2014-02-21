From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Feb 2014 23:31:29 +0100
Subject: [Buildroot] [PATCH] Config: default BR2_PACKAGE_OVERRIDE_FILE
	to $(CONFIG_DIR)/local.mk
In-Reply-To: <20140221221128.GA16700@free.fr> (Yann E. MORIN's message of
 "Fri, 21 Feb 2014 23:11:28 +0100")
References: <1391032104-18150-1-git-send-email-yann.morin.1998@free.fr>
 <20140221221128.GA16700@free.fr>
Message-ID: <8738jcumgu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > All,
 > On 2014-01-29 22:48 +0100, Yann E. MORIN spake thusly:
 >> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> 
 >> The current default for BR2_PACKAGE_OVERRIDE_FILE points to:
 >> $(TOPDIR)/local.mk
 >> 
 >> This works well for in-tree builds, but is not very useful for
 >> out-of-tree builds, when the Buildroot source tree may be shared for
 >> different concurrent builds.
 >> 
 >> Also, it seems to be more sensible to have local.mk alognside
 >> the .config file.
 >> 
 >> Hence, change the default for BR2_PACKAGE_OVERRIDE_FILE to point to:
 >> $(CONFIG_DIR)/local.mk
 >> 
 >> Note that this does not change the current behaviour for in-tree
 >> builds, since in that case $(CONFIG_DIR) == $(TOPDIR).
 >> 
 >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 >> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

 > Ping? For -next?

Sorry, I must have missed it.

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
