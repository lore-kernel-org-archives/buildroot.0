From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 23:54:35 +0100
Subject: [Buildroot] [Patch v3 2/9] execline: new package
In-Reply-To: <1482182955-23916-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1482182955-23916-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1482182955-23916-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20170301235435.7694731c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Dec 2016 22:29:08 +0100, Eric Le Bihan wrote:
> This package provides execline, a (non-interactive) scripting language,
> like sh, used in the s6 supervision system.
> 
> The host variant is provided as it is required to build and run the host
> variants of s6 and s6-rc.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/Config.in              |  1 +
>  package/execline/Config.in     | 12 ++++++++
>  package/execline/execline.hash |  2 ++
>  package/execline/execline.mk   | 70 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 85 insertions(+)
>  create mode 100644 package/execline/Config.in
>  create mode 100644 package/execline/execline.hash
>  create mode 100644 package/execline/execline.mk

Applied to master, after adding an entry to the DEVELOPERS file for
this package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
