From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:16:01 +0200
Subject: [Buildroot] [PATCH 0/14 v3] freescale: update userspace
 packages (branch yem/fsl-imx)
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <20140715231601.607ff816@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 30 Jun 2014 23:52:10 +0200, Yann E. MORIN wrote:

> This series updates the Freescale userland components to the latest
> available (stable) versions:
> 
>  1     : bump the global freescale version
>  2..5  : adapt packages to the new version
>  6..9  : bump packages which version does not follow the global version
>  10    : tentative patch to re-use the generic i.MX platform in
>          gst-fsl-plugins
>  11..14: bump a few iMX defconfigs

I've applied patches 1 to 13, but not patch 14 since there are pending
issues on it. Please resubmit separately.

I've noticed that Arnout mentioned that patches should be squashed for
bisectability, but after a quick discussion with Yann on IRC, he
reminded me that usually, Peter prefers small patches over
bisectability. It was for example also what we did for big bumps such
as X.org bumps.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
