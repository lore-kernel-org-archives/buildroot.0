From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Mar 2019 17:48:41 +0100
Subject: [Buildroot] [PATCH] package/musl: remove rcrt1.o from target
 installation
In-Reply-To: <20190306163316.6117-1-norbert.lange@andritz.com>
References: <20190306163316.6117-1-norbert.lange@andritz.com>
Message-ID: <20190306174841.4f8b67a1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

Thanks for your patch!

On Wed,  6 Mar 2019 17:33:16 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> From: Norbert Lange <nolange79@gmail.com>
> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>

Could you give some more details ?

In fact, your patch does not remove rcrt1.o from target installation:
it ensures that the target installation does *NOT* remove it from
TARGET_DIR.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
