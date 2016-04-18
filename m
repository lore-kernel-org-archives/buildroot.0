From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Apr 2016 21:33:53 +0200
Subject: [Buildroot] [PATCH v8 06/14] package/speex: remove no longer
 needed hook
In-Reply-To: <1460929111-15615-7-git-send-email-s.martin49@gmail.com>
References: <1460929111-15615-1-git-send-email-s.martin49@gmail.com>
 <1460929111-15615-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20160418213353.599efe93@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Apr 2016 23:38:23 +0200, Samuel Martin wrote:

> -define SPEEX_LIBTOOL_FIXUP
> -	$(SED) 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' $(@D)/libtool
> -	$(SED) 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' $(@D)/libtool
> -endef
> -
>  SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP

So presumably this line is also not useful anymore?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
