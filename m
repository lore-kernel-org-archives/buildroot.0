From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 18:06:16 +0100
Subject: [Buildroot] [PATCH 1/2] package/zeromq: drop AUTORECONF
In-Reply-To: <20210122223723.3178834-1-fontaine.fabrice@gmail.com>
References: <20210122223723.3178834-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123180616.77d7db9a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 23:37:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 64ec0541d56cb05aa5898c42f26dd6b531d9b96a forgot to drop
> ZEROMQ_AUTORECONF
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zeromq/zeromq.mk | 2 --
>  1 file changed, 2 deletions(-)

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
