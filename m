From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 19:39:16 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/exim: Add optional OpenSSL
 support
In-Reply-To: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150412193916.7f70a6ab@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Apr 2015 13:25:42 +0200, Bernd Kuhls wrote:
> Also add TARGET_MAKE_ENV to EXIM_BUILD_CMDS to enable access to our pkg-config.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: Add comment about TARGET_MAKE_ENV (Baruch)
> v2: Use pkg-config to detect openssl (Yann)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
