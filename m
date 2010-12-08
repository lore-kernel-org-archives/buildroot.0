From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:52 +0100
Subject: [Buildroot] [pull request] For branch pre-package-generation-2011.02
Message-ID: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In preparation of the package generation work, some fixes have to be
done. These fixes are mostly related to ensure files are well
installed even in an empty directory and also ensure $(STAGING_DIR)
and $(TARGET_DIR) are evaluated at the right moment (ie. when we're
going to replace these variables to generate a tarball/ipk
package/etc...).

This branch is pullable here :

     git://git.potipota.net/buildroot pre-package-generation-2011.02

Best regards,

--
Lionel Landwerlin
