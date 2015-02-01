From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 1 Feb 2015 23:31:25 +0100
Subject: [Buildroot] [PATCH 1/8 v2] package/libftdi: fix libftdi.pc
In-Reply-To: <1422220435-18689-2-git-send-email-s.martin49@gmail.com>
References: <1422220435-18689-1-git-send-email-s.martin49@gmail.com>
 <1422220435-18689-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150201233125.14bdb8c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun, 25 Jan 2015 22:13:48 +0100, Samuel Martin wrote:
> This patch fixes libftdi pkg-config module, so that packages linking
> against libftdi correctly have all needed CFLAGS and LIBS defined,
> especially when running a static build.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/
> 
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
