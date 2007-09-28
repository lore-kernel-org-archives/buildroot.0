From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Sat, 29 Sep 2007 02:51:28 +0300
Subject: [Buildroot] PATCH [1/2] try2: make Makefile.autotools.in not to
 use hardcoded x11r7 name when patching
In-Reply-To: <20070928224019.GG20951@aon.at>
References: <46FD70EC.2010104@promwad.com> <20070928203604.GW20951@aon.at>
	<46FD8D6A.40605@promwad.com> <20070928224019.GG20951@aon.at>
Message-ID: <46FD9380.9090905@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer ?????:
> 
> One nice example that, if it is handled properly by the autotools.in is
> package/gmp or mpfr for that matter.
> 
> This package shows nicely what the autotools.in should provide in the
> long run:
> - downloading a PATCH_FILE to the dl/
> - patching package/$name/$name$version
>   or 
>   patching package/$name/$version
>   or 
>   patching package/$name/$($(name)_patch_regex)
>   or the like
> - in configure, honor PREFERRED_LIB_FLAGS et al
> - $(STRIP) the target, perhaps. Distinguish between binaries and libs
> - optionally install headers if BR2_HAVE_HEADERS
> - package-specific additional {C,LD,CPP,...}FLAGS
> - package-specific additional configure-opts
> - knowledge if both staging and target or only one of these should be
>   populated with libs/binaries
> 

I'll try to follow this but a bit later, now my priority is  directfb/x11r7/gtk+ running on ARM.
I'll post a bunch of patches related to selecting gtk+ depends on directfb or on x11r7.

Best regards,
Ivan
--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
