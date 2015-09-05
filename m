From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Sep 2015 11:44:41 +0200
Subject: [Buildroot] [PATCHv3] system: add options for /bin /sbin and
 /lib to be symlinks into /usr
In-Reply-To: <55EAB410.1070300@mind.be>
References: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
 <55EAB410.1070300@mind.be>
Message-ID: <20150905114441.2e18623d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Sep 2015 11:21:20 +0200, Arnout Vandecappelle wrote:

> > +ifeq ($(BR2_ROOTFS_MERGED_USR),)
> > +EUDEV_CONF_OPTS += --with-rootlibdir=/lib --enable-split-usr
> > +endif
> 
>  It would be nice if someone could do a runtime test with eudev, both the merged
> and the split case.

I can add some test cases in my testing infrastructure, to test the
eudev merged and split cases, and the systemd case. It makes it a lot
easier than doing manual testing over and over again when you want to
test new iterations of the patches.

Let me know if there is some interest :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
