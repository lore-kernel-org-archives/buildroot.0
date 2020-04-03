From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Apr 2020 09:52:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/cog: bump to version 0.6.0
In-Reply-To: <20200331175325.110755-1-james.hilliard1@gmail.com> (James
 Hilliard's message of "Tue, 31 Mar 2020 11:53:25 -0600")
References: <20200331175325.110755-1-james.hilliard1@gmail.com>
Message-ID: <87sghl57lj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:

 > Drop patches that are now upstream.
 > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - explicitly disable man pages and weston direct display
 
 > -COG_VERSION = 0.4.0
 > +COG_VERSION = 0.6.0
 >  COG_SITE = https://wpewebkit.org/releases
 >  COG_SOURCE = cog-$(COG_VERSION).tar.xz
 >  COG_INSTALL_STAGING = YES
 > @@ -15,6 +15,8 @@ COG_CONF_OPTS = \
 >  	-DCOG_BUILD_PROGRAMS=ON \
 >  	-DCOG_PLATFORM_FDO=ON \
 >  	-DCOG_PLATFORM_DRM=OFF \
 > +	-DCOG_WESTON_DIRECT_DISPLAY=OFF \
 > +	-DINSTALL_MAN_PAGES=OFF \

What happened to the proposed -DCOG_PLATFORM_DRM=OFF?

Committed, thanks.

-- 
Bye, Peter Korsgaard
