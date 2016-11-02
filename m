From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Nov 2016 17:28:08 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.11.0-P1
In-Reply-To: <1478041154-5037-1-git-send-email-gustavo@zacarias.com.ar>
References: <1478041154-5037-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161102172808.3866a924@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 Nov 2016 19:59:14 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2016-8864 - denial-of-service vector which can potentially be
> exploited against BIND 9 servers.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/bind.hash | 2 +-
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, after fixing the hash URL, as pointed out by Vicente.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
