From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 May 2016 13:33:57 +0200
Subject: [Buildroot] [PATCH v2] package/mplayer: fix aarch64 compilation
In-Reply-To: <1464426192-23925-1-git-send-email-bernd.kuhls@t-online.de>
References: <1464426192-23925-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160528133357.3c128dc3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 May 2016 11:03:12 +0200, Bernd Kuhls wrote:
> Added code to define HAVE_ARMV8 when needed.
> 
> Fixes
> http://autobuild.buildroot.net/results/5f8/5f85c32eb89aac48ae8da892d9800bd13274cd3e/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v2: adjusted patch for patched file

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
