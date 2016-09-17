From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2016 14:05:02 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/libupnpp: add patch to get
 pkg-config file
In-Reply-To: <20160915064001.8684-2-joerg.krause@embedded.rocks>
References: <20160915064001.8684-1-joerg.krause@embedded.rocks>
 <20160915064001.8684-2-joerg.krause@embedded.rocks>
Message-ID: <20160917140502.175fc4bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 08:39:56 +0200, J?rg Krause wrote:
> Apply a patch from upstream to install a pkg-config file for libupnpp.
> 
> Fetch from:
> https://github.com/medoc92/libupnpp/commit/9f03bb0e7b47e2843edea6f25ed9eabbfb6412df
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libupnpp/0002-Add-pkg-config-file.patch | 63 +++++++++++++++++++++++++
>  package/libupnpp/libupnpp.mk                    |  4 +-
>  2 files changed, 66 insertions(+), 1 deletion(-)
>  create mode 100644 package/libupnpp/0002-Add-pkg-config-file.patch

Entire patch series applied, thanks!

Hopefully all those patches are going to end up in their respective
upstream projects, so that we can at some point remove them from
Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
