From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:36:19 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: fix build on
 toolchain without C++
In-Reply-To: <1546120994-28217-1-git-send-email-james.hilliard1@gmail.com>
References: <1546120994-28217-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20181230153619.3bcc68cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Dec 2018 06:03:14 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> This is a backport from upstream.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> 
> ---
> Changes v1 -> v2:
>   - Fixup patch and change commit message
> ---
>  ...-use-cross-compilation-compatible-c-check.patch | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/systemd/0003-meson-use-cross-compilation-compatible-c-check.patch

Applied to master after adjusting the patch description as suggested by
Yann. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
