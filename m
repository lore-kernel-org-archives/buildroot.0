From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:20:52 +0100
Subject: [Buildroot] [PATCH 3/3] package/nodejs: use shared nghttp2
 library
In-Reply-To: <20190314133813.727-4-martin@barkynet.com>
References: <20190314133813.727-1-martin@barkynet.com>
 <20190314133813.727-4-martin@barkynet.com>
Message-ID: <20190315222052.4c0a4079@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 14 Mar 2019 13:38:13 +0000
Martin Bark <martin@barkynet.com> wrote:

> Signed-off-by: Martin Bark <martin@barkynet.com>
> ---
>  package/nodejs/Config.in | 1 +
>  package/nodejs/nodejs.mk | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
