From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 22:53:52 +0200
Subject: [Buildroot] [PATCH v3 2/2] fs/jffs2: copy xattrs
In-Reply-To: <20201008090836.2670553-2-antoine.tenart@bootlin.com> (Antoine
 Tenart's message of "Thu, 8 Oct 2020 11:08:36 +0200")
References: <20201008090836.2670553-1-antoine.tenart@bootlin.com>
 <20201008090836.2670553-2-antoine.tenart@bootlin.com>
Message-ID: <87ft6lera7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Antoine" == Antoine Tenart <antoine.tenart@bootlin.com> writes:

 > This patch sets the --with-xattr option when generating an image with
 > mkfs.jffs2, so that SELinux security contexts and other extended
 > attributes will be kept and available in jffs2 images.

 > Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
 > ---

 > Since v2:
 >   - Removed condition on BR2_PACKAGE_LIBSELINUX.

 > Since v1:
 >   - s/BR2_PACKAGE_REFPOLICY/BR2_PACKAGE_LIBSELINUX/


Committed to 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
