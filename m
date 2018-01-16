From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Jan 2018 23:11:24 +0100
Subject: [Buildroot] [PATCH 1/1] boost: fix build with domoticz
In-Reply-To: <20180116182900.18585-1-fontaine.fabrice@gmail.com>
References: <20180116182900.18585-1-fontaine.fabrice@gmail.com>
Message-ID: <20180116231124.7fd5b0fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Jan 2018 19:29:00 +0100, Fabrice Fontaine wrote:
> Fix domoticz build with boost 1.66 and g++5
> 
> Patch fetch from one of the answer of
>  https://github.com/domoticz/domoticz/issues/2034:
>  workaround suggested to the boost developers
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/dec57c19e9aa2e367e23de2232c1d22a2f226a32
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boost/0005-fix-build-with-g-5.patch | 32 +++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/boost/0005-fix-build-with-g-5.patch

The patch is definitely a bit hackish, so I would prefer a gcc fix. But
until that happens and all gcc 5.x toolchains get updated, it's good to
have a workaround for the problem. So I've applied your patch to the
master branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
