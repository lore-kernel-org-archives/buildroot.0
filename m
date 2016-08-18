From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:26:16 +0200
Subject: [Buildroot] [PATCH] nettle: add security patch
In-Reply-To: <1471545256-21052-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471545256-21052-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160818232616.074251a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 15:34:16 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-6489 - RSA code is vulnerable to cache sharing related attacks.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/nettle/0002-fix-CVE-2016-6489.patch | 181 ++++++++++++++++++++++++++++
>  package/nettle/nettle.mk                    |   2 +
>  2 files changed, 183 insertions(+)
>  create mode 100644 package/nettle/0002-fix-CVE-2016-6489.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
