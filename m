From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:39:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/openipmi: install to staging dir
In-Reply-To: <20191216093803.4957-1-skif@skif-web.ru>
References: <20191216093803.4957-1-skif@skif-web.ru>
Message-ID: <20191222143919.5734bdc8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 12:38:03 +0300
Alexey Lukyanchuk <skif@skif-web.ru> wrote:

> Needed for packages which depend from openipmi
> 
> Signed-off-by: Alexey Lukyanchuk <skif@skif-web.ru>
> ---
>  package/openipmi/openipmi.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
