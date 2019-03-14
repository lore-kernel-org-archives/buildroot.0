From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Mar 2019 23:13:17 +0100
Subject: [Buildroot] [PATCH] package/musl: remove rcrt1.o from target
 installation
In-Reply-To: <20190306163316.6117-1-norbert.lange@andritz.com>
References: <20190306163316.6117-1-norbert.lange@andritz.com>
Message-ID: <20190314231317.7e564c88@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Mar 2019 17:33:16 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> From: Norbert Lange <nolange79@gmail.com>
> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  package/musl/musl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
