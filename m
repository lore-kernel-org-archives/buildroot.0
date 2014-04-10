From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 10 Apr 2014 23:18:12 +0200
Subject: [Buildroot] [PATCH 1/2] systemd: Build legacy pc files when
	liblogging is
In-Reply-To: <20140410175032.GA24213@pc-eric> (Eric Le Bihan's message of
 "Thu, 10 Apr 2014 19:50:34 +0200")
References: <1397145566-11243-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140410175032.GA24213@pc-eric>
Message-ID: <87lhvc6fzf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

Hi,

 > Maybe some other packages depend on these compatibility libraries, so instead
 > of referring to BR2_PACKAGE_LIBLOGGING in systemd.mk, it would be best to add
 > a generic configuration option to systemd, as done for berkeleydb with
 > BR2_PACKAGE_BERKELEYDB_COMPAT185. It could be named BR2_PACKAGE_SYSTEMD_COMPAT.

 > Then, in package/liblogging/Config.in, we would have:

 >   select BR2_PACKAGE_SYSTEMD_COMPAT if BR2_INIT_SYSTEMD

 > And this would be removed when liblogging is fixed upstream.

Yes, I agree.

 > What do think of this?

Care to send an updated patch series doing that?

-- 
Bye, Peter Korsgaard
