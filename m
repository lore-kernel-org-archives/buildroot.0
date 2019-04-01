From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 23:08:34 +0200
Subject: [Buildroot] [PATCH v2 1/2] pkg-generic: Depend on host-{xz,
 lzip} only for fitting archives
In-Reply-To: <20190317212014.3831-1-nolange79@gmail.com>
References: <20190317212014.3831-1-nolange79@gmail.com>
Message-ID: <20190401230834.016dfe0a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 17 Mar 2019 22:20:13 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> results in cleaner dependency graphs, and usually omits host-lzip
> from being built.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)

I improved the commit log, modified the code as suggested by Yann, and
applied. Thanks, this is a very useful change!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
