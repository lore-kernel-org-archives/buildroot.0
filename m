From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Dec 2008 14:08:54 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <20081201130602.AB0FD3C78E@busybox.net>
References: <20081201130602.AB0FD3C78E@busybox.net>
Message-ID: <20081201140854.287670ff@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon,  1 Dec 2008 05:06:02 -0800 (PST),
egtvedt at uclibc.org a ?crit :

> UTC (rev 24212) @@ -342,8 +342,6 @@ -no-rpath \
>  		-nomake examples \
>  		-nomake demos \
> -		-I $(STAGING_DIR)/usr/include \
> -		-L $(STAGING_DIR)/usr/lib \

These lines have been added by me in revision 24001. They are necessary
to allow compilation with an external toolchain.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
