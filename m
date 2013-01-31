From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Thu, 31 Jan 2013 09:20:26 +0100
Subject: [Buildroot] [PATCH] Add support for plain URL in $(PKG)_PATCH
	variable
In-Reply-To: <8398960.ALrh5xOxZ9@sagittae>
References: <201301302023.59219.yann.morin.1998@free.fr>
 <201301302354.24029.yann.morin.1998@free.fr> <8398960.ALrh5xOxZ9@sagittae>
Message-ID: <1488344.EXHhgBAzS0@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 31 January 2013 00:11:08 J?r?me Pouiller wrote:
> On Wednesday 30 January 2013 23:54:23 Yann E. MORIN wrote:
> > J?r?me, All,
> > 
> > On Wednesday 30 January 2013 J?r?me Pouiller wrote:
> > > Until now, $(PKG)_PATCH allow only to download patches from same URL
> > > than
> > > tarball. This patch allow to detect when plain URL are used in
> > > $(PKG)_PATCH and correctly handle them.
> > > 
> > > Downloaded patches are named
> > > $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME).patch
> > 
> > Well, I meant: $(PKG_NAME)-$(PKG_VERSION)-$(PKG_PATCH_FILENAME)
> > We should keep the original filename (in case it is compresed).
> 
> In this case, I think files ending with .diff will not work (and compressed
> patches are not supported without a HOOK).
Forget this comment, I was tired.

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
