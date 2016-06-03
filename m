From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jun 2016 16:14:05 +0200
Subject: [Buildroot] [PATCH 3/4] vpnc: bump to newer upstream version
In-Reply-To: <20160419221637.GK3505@free.fr>
References: <1455145392-2355-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455145392-2355-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160419221637.GK3505@free.fr>
Message-ID: <20160603161405.0b2ba998@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Apr 2016 00:16:37 +0200, Yann E. MORIN wrote:

> > +Submitted upstream at https://github.com/ndpgroup/vpnc/pull/6  
> 
> There has been a comment to request the patches be mailed to the "real"
> upstream, and the PR was closed.

I submitted upstream:
http://lists.unix-ag.uni-kl.de/pipermail/vpnc-devel/2016-June/004186.html.

> >  	depends on BR2_USE_MMU # fork()
> > +	depends on BR2_USE_WCHAR  
> 
> Is it because of gnutls, or does vpnc requires it for itself?
> If the former, you forgot the associated comment:

Because of gnutls, so I've added the comment.

> > +commit "vpnc needs a toolchain w/ wchar"  
> 
> Nope, this is not a commit; this is a comment. ;-)

Fixed. I've applied with those changes.

Thanks for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
