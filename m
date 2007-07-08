From: Cristian Ionescu-Idbohrn <cristian.ionescu-idbohrn@axis.com>
Date: Sun, 8 Jul 2007 15:34:56 +0200 (CEST)
Subject: [Buildroot] missing expat-dirclean target
In-Reply-To: <20070708131108.GL4096@aon.at>
References: <0707081407520.26961@somehost> <20070708121822.GH4096@aon.at>
	<0707081504270.3987@somehost> <20070708131108.GL4096@aon.at>
Message-ID: <0707081531500.3987@somehost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 8 Jul 2007, Bernhard Fischer wrote:

> >> this package uses wrong installation pathes, please fix and test while
> >> you're at it (i don't use it):
> >>
> >>                 --includedir=/include \
> >> is wrong, whould be /usr/include. Most of these pathes are not needed,
> >> just --prefix=/usr should be enough.
> >
> >Will do.
>
> thanks alot in advance!

Done this too now.
Please have a look att the attached (broke some long lines too).


-- 
Cristian
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ex.patch
Type: text/x-diff
Size: 1633 bytes
Desc: 
Url : http://busybox.net/lists/buildroot/attachments/20070708/7d362ac3/attachment-0001.bin 
