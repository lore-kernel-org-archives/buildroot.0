From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 17:55:04 +0200
Subject: [Buildroot] [PATCH] musl: security bump to version 1.1.8
In-Reply-To: <1427714621-13289-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427714621-13289-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150330175504.34214548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 30 Mar 2015 08:23:41 -0300, Gustavo Zacarias wrote:
> Fixes:
> CVE-2015-1817 - stack-based buffer overflow in IPv6 literal parsing.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/musl/musl.hash | 2 +-
>  package/musl/musl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
