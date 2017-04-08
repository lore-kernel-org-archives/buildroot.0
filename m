From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:38:53 +0200
Subject: [Buildroot] [PATCH v3] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170408190346.GS5361@waldemar-brodkorb.de>
References: <20170323071058.GA29887@waldemar-brodkorb.de>
 <20170408160552.131d42a4@free-electrons.com>
 <20170408190346.GS5361@waldemar-brodkorb.de>
Message-ID: <20170408213853.369b3890@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Apr 2017 21:03:46 +0200, Waldemar Brodkorb wrote:
> > Please PKG_CHECK_MODULES() instead.  
> 
> I tried, but failed. Do you have some examples how
> PKG_CHECK_MODULES() should be used? I am not a autotool expert, so I
> am unsure how to create a patch which will be accepted by upstream.

See https://autotools.io/pkgconfig/pkg_check_modules.html, it's a good
and simple tutorial on how to use PKG_CHECK_MODULES().

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
