From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 14 May 2014 12:47:19 +0200
Subject: [Buildroot] [PATCH 0/4] Replace 'echo -e' with printf
In-Reply-To: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <CAAXf6LX0=8avsY5ws3OViAfk7SEZ3R1JVAzrKTknoh5yy6ugTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 14, 2014 at 12:26 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> Hi all
>
> This little series, is only aimed as a follow up of Peter's comment on Samuel's
> patch. (http://patchwork.ozlabs.org/patch/342023/)
>
> Maxime Hadjinlian (4):
>   acpid: replace "echo -e" with printf
>   eudev: replace "echo -en" with printf
>   udev: replace "echo -en" with printf
>   infra: pkg-utils.mk replace "echo -en" with printf
>
>  package/acpid/acpid.mk | 2 +-
>  package/eudev/S10udev  | 4 ++--
>  package/pkg-utils.mk   | 2 +-
>  package/udev/S10udev   | 4 ++--
>  4 files changed, 6 insertions(+), 6 deletions(-)
>

Entire series:
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
