From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 May 2017 09:24:16 +0200
Subject: [Buildroot] [PATCH] package/x11vnc: fix build issue with
 --without-ssl
In-Reply-To: <20170515202850.17653-1-romain.naour@gmail.com>
References: <20170515202850.17653-1-romain.naour@gmail.com>
Message-ID: <20170516092416.32e356bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 May 2017 22:28:50 +0200, Romain Naour wrote:
> Fixes:
> http://autobuild.buildroot.net/results/873/873ed8f2ade1d969abdff15b7b6d63e04819af9a
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  ...r-detection-when-using-without-crypt-cryp.patch | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 package/x11vnc/0001-Fix-compiler-detection-when-using-without-crypt-cryp.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
