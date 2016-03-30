From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 19:34:40 +0200
Subject: [Buildroot] [PATCH 1/1] mxml: add host-autotools-package macro
In-Reply-To: <CAPjqk-+dBjt-XZ7HY6UvuHO51U+JF8P4oEshSiHYsjbMeCVECQ@mail.gmail.com>
References: <1458041510-19966-1-git-send-email-ricardo.crudo@gmail.com>
 <20160315143838.2683f35c@free-electrons.com>
 <CAPjqk-+dBjt-XZ7HY6UvuHO51U+JF8P4oEshSiHYsjbMeCVECQ@mail.gmail.com>
Message-ID: <20160330193440.37c806ee@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2016 15:39:04 +0100, Ricardo Crudo wrote:

> None present on buildroot now, only in my user packages. They are LV2
> plugins, one I remind now is ZynAddSubFX (
> http://zynaddsubfx.sourceforge.net/).

OK. Then I think it's better if you submit this patch adding the host
variant of mxml together with the submission of those additional
packages that need it.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
