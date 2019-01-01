From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:12:48 +0100
Subject: [Buildroot] [PATCH] package/json-for-modern-cpp: relax
 dependency on cmake version
In-Reply-To: <20181231185344.18570-1-yann.morin.1998@free.fr>
References: <20181231185344.18570-1-yann.morin.1998@free.fr>
Message-ID: <20190101111248.02b30b89@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 31 Dec 2018 19:53:44 +0100, Yann E. MORIN wrote:
> Currently, json-for-modern-cpp requires cmake to be at least cmake-3.8,
> but our dependencies only check for cmake-3.1.
> 
> It turns out that json-for-modern-cpp is over strict, and could very
> well do with just cmake-3.1
> 
> Fixes:
>     http://autobuild.buildroot.org/results/1f8/1f893d8bc7df3bfefd31df69aba918e2121cfaf7/
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Adam Duskett <aduskett@gmail.com>
> ---
>  ...system-relax-requirement-on-cmake-version.patch | 85 ++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 package/json-for-modern-cpp/0001-buildsystem-relax-requirement-on-cmake-version.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
