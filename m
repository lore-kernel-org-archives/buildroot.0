From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 18:42:25 +0200
Subject: [Buildroot] [PATCH v2] lsscsi: add new package
In-Reply-To: <20170512124101.3876-1-antonynpavlov@gmail.com>
References: <20170512124101.3876-1-antonynpavlov@gmail.com>
Message-ID: <20170611184225.3deb4bfb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 May 2017 15:41:01 +0300, Antony Pavlov wrote:
> Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Thanks for this patch. I've applied to master after doing a few
changes. See below.

> ---
>  package/Config.in          |  1 +
>  package/lsscsi/Config.in   |  6 ++++++
>  package/lsscsi/lsscsi.hash |  2 ++
>  package/lsscsi/lsscsi.mk   | 13 +++++++++++++
>  4 files changed, 22 insertions(+)

You forgot to add an entry to the DEVELOPERS file, so I've done so.

> +LSSCSI_LICENSE = GPLv2

We now use SPDX license codes everywhere, so GPL-2.0. And the license
is in fact "GPL version 2 or later", so I've changed this to GPL-2.0+.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
