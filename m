From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Aug 2014 12:02:02 +0200
Subject: [Buildroot] [PATCH v2 2/2] Revert "package/localedef: don't use
 config.site when cross-compiling"
In-Reply-To: <1408698774-13615-2-git-send-email-romain.naour@openwide.fr>
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
 <1408698774-13615-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <CAAXf6LWM32ew-GsNuUkff75Lcr+_R7rCTjMyhT2W-3t36tyyQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 22, 2014 at 11:12 AM, Romain Naour <romain.naour@openwide.fr> wrote:
> CONFIG_SITE is now a part of pkg-autotools infrastructure.
>
> This reverts commit 85448febb3c9f21e6e4082fc344b3ef46261c782.
>
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
