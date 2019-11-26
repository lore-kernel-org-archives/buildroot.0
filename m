From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 12:52:33 +0100
Subject: [Buildroot] [PATCH] package/glibc: install locale utility when
 nls is enabled
In-Reply-To: <20191126085541.2688-1-p.debruijn@unilogic.nl>
References: <20191126085541.2688-1-p.debruijn@unilogic.nl>
Message-ID: <20191126125233.12621eba@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 26 Nov 2019 09:55:41 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/glibc/Config.in | 2 +-
>  package/glibc/glibc.mk  | 3 +++
>  2 files changed, 4 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
