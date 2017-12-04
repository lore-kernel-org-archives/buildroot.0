From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 11:35:42 +0100
Subject: [Buildroot] [PATCH 6/6] package/linphone: fix URL of Debian
 patches
In-Reply-To: <20170829215219.3024113c@windsurf.lan>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
 <20170829191005.19697-6-bernd.kuhls@t-online.de>
 <20170829215219.3024113c@windsurf.lan>
Message-ID: <20171204113542.5c8fb604@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Tue, 29 Aug 2017 21:52:19 +0200, Thomas Petazzoni wrote:

> On Tue, 29 Aug 2017 21:10:05 +0200, Bernd Kuhls wrote:
> 
> > -	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav9.patch \
> > -	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav10.patch \
> > -	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/libav11.patch \
> > -	https://sources.debian.net/data/main/l/linphone/3.6.1-2.5/debian/patches/ffmpeg_2.9.patch
> > +	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav9.patch \
> > +	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav10.patch \
> > +	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/libav11.patch \
> > +	https://sources.debian.net/data/main/l/linphone/3.6.1-3/debian/patches/ffmpeg_2.9.patch  
> 
> We will have to constantly update those, because sources.debian.net
> doesn't keep all versions of a package, only the most recent ones.
> 
> Can we use
> http://snapshot.debian.org/archive/debian/20161118T211932Z/pool/main/l/linphone/linphone_3.6.1-3.debian.tar.xz
> instead ? This URL is guaranteed to not change.

Kind ping on this comment. We still have your patch pending in
patchwork. I believe the change requested here is quite reasonable.
Could you submit an updated version ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
