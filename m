From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 10 Apr 2017 07:33:59 +0200
Subject: [Buildroot] [PATCH v3] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170408213853.369b3890@free-electrons.com>
References: <20170323071058.GA29887@waldemar-brodkorb.de>
 <20170408160552.131d42a4@free-electrons.com>
 <20170408190346.GS5361@waldemar-brodkorb.de>
 <20170408213853.369b3890@free-electrons.com>
Message-ID: <20170410053359.GU5361@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, 8 Apr 2017 21:03:46 +0200, Waldemar Brodkorb wrote:
> > > Please PKG_CHECK_MODULES() instead.  
> > 
> > I tried, but failed. Do you have some examples how
> > PKG_CHECK_MODULES() should be used? I am not a autotool expert, so I
> > am unsure how to create a patch which will be accepted by upstream.
> 
> See https://autotools.io/pkgconfig/pkg_check_modules.html, it's a good
> and simple tutorial on how to use PKG_CHECK_MODULES().

I have seen the tutorial, I thought about a howto with more real
life examples. I looked into nfs-utils and linux-pam and tried
some stuff, but unfortunately I failed.

I am given up for now.

best regards
 Waldemar
