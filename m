From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jul 2015 13:02:17 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.9.7-P2
In-Reply-To: <1438165446-14091-1-git-send-email-gustavo@zacarias.com.ar>
References: <1438165446-14091-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150729130217.47e731b4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 29 Jul 2015 07:24:06 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2015-5477 - An error in handling TKEY queries can cause named
> to exit with a REQUIRE assertion failure.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/bind/bind.hash | 4 ++--
>  package/bind/bind.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
