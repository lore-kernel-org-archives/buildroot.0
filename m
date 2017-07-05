From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 22:03:26 +0200
Subject: [Buildroot] [PATCH v1] qt5multimedia: fix plugins videonode egl
 x11 header related compile failure
In-Reply-To: <20170705215319.42939a87@gmx.net>
References: <20170626211311.10890-1-ps.report@gmx.net>
 <20170702003332.771dd45c@windsurf>
 <20170702210127.7090df5b@gmx.net>
 <20170702231449.4a4d1832@windsurf>
 <20170705215319.42939a87@gmx.net>
Message-ID: <20170705220326.0f121c3a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jul 2017 21:53:19 +0200, Peter Seiderer wrote:

> > > but in general your are right, honor the given provider provided flags would be
> > > the better solution...maybe something as suggested on the yocto meta-freescale
> > > mailing list will work, see [2], [3]: 'egl.prf: Fix build error when egl headers
> > > need platform definition'?  
> 
> And two links to the upstream suggestion/discussion:
> 
> - QTBUG-61712: qtbase: A build error was occurring due to missing EGL configuration
>   https://bugreports.qt.io/browse/QTBUG-61712
> 
> - Patch: qtbase: Fix build error when using EGL
>   https://codereview.qt-project.org/#/c/198906/

I'm not used to the Qt contribution workflow, but the patch visible
through those links looks good (use CFLAGS provided by the EGL .pc
file), and the reception seems positive (+6 votes on the code review
tool).

So it all seems to be going in the right direction, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
