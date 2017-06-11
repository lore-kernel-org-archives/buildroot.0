From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 15:54:16 +0200
Subject: [Buildroot] [PATCH v2] package/directfb: enable static build
 for BR2_PACKAGE_DIRECTFB_TSLIB
In-Reply-To: <20170608101537.32705-1-martin.kepplinger@ginzinger.com>
References: <20170608074642.26516-1-martin.kepplinger@ginzinger.com>
 <20170608101537.32705-1-martin.kepplinger@ginzinger.com>
Message-ID: <20170611155416.5f0b2401@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Jun 2017 12:15:37 +0200, Martin Kepplinger wrote:
> The dependency on !BR2_STATIC_LIBS was here because of tslib not supporing
> static builds. But since
> 
>    commit 05fadfea1 ("package/tslib: enable statically linked building")
> 
> it does and we can remove this dependecy.
> 
> Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
