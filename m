From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Jun 2020 21:53:42 +0200
Subject: [Buildroot] [PATCH 1/5] toolchain: add gcc 10 entry
In-Reply-To: <20200608221347.2639059-1-romain.naour@gmail.com>
References: <20200608221347.2639059-1-romain.naour@gmail.com>
Message-ID: <20200624215342.2ad58b6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  9 Jun 2020 00:13:43 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> In order to add gcc 10 support for internal and external toolchain in
> follow-up commits, introduce BR2_TOOLCHAIN_GCC_AT_LEAST_10 symbol.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
