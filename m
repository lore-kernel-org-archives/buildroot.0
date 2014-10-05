From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 23:22:15 +0200
Subject: [Buildroot] [PATCH 2/3] hicolor-icon-theme: new package
In-Reply-To: <1411489271-26899-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1411489271-26899-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20141005232215.48f593d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Tue, 23 Sep 2014 18:21:10 +0200, Eric Le Bihan wrote:
> This new package provides Freedesktop Hicolor icon theme.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in                                |  1 +
>  package/hicolor-icon-theme/Config.in             |  4 ++++
>  package/hicolor-icon-theme/hicolor-icon-theme.mk | 12 ++++++++++++
>  3 files changed, 17 insertions(+)
>  create mode 100644 package/hicolor-icon-theme/Config.in
>  create mode 100644 package/hicolor-icon-theme/hicolor-icon-theme.mk

I'm a bit confused by what this package does: it doesn't contain
anything, and does not install anything except a huge number of
directories (empty) in usr/share/icons/. Is this the intended behavior?
I would have expected an icon theme to install some .svg or .png files,
no?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
