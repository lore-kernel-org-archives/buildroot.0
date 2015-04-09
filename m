From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Wed, 8 Apr 2015 19:21:48 -0500
Subject: [Buildroot] [PATCH 1/1] tovid: change from SVN to github
In-Reply-To: <1428534958-5528-1-git-send-email-skenton@ou.edu>
References: <1428534958-5528-1-git-send-email-skenton@ou.edu>
Message-ID: <CALq67GCQ__Sb_8oLhZ2iUwucH1nyiGObj0CUnfZpar989XUFEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve,

On Wed, Apr 8, 2015 at 6:15 PM, Steve Kenton <skenton@ou.edu> wrote:
> New download information for tovid plus hash file
>
> Signed-off-by: Steve Kenton <skenton@ou.edu>
> ---
>  package/tovid/tovid.hash | 2 ++
>  package/tovid/tovid.mk   | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>  create mode 100644 package/tovid/tovid.hash
>
> diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
> new file mode 100644
> index 0000000..9ddd750
> --- /dev/null
> +++ b/package/tovid/tovid.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz

I have locally verified the hash file and verified that it builds for
qemu_x86_defconfig configuration.

Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>
Tested-by: Ryan Barnett <ryanbarnett3@gmail.com>

Thanks,
-Ryan
