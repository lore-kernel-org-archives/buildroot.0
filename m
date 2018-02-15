From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Feb 2018 15:53:21 -0600
Subject: [Buildroot] [PATCH 1/2] libqmi: Update to use libqmi 1.20.0
In-Reply-To: <1518727506-15403-1-git-send-email-jared.bents@rockwellcollins.com>
References: <1518727506-15403-1-git-send-email-jared.bents@rockwellcollins.com>
Message-ID: <CANQCQpY+rpUGhhBxc2K9Zr=2SCu5b4gRNA-eSusXaqZ3Hr9YUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jared,

On Thu, Feb 15, 2018 at 2:45 PM, Jared Bents
<jared.bents@rockwellcollins.com> wrote:
>
> Update to use libqmi 1.20.0
>
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> ---
>  package/libqmi/libqmi.hash | 2 +-
>  package/libqmi/libqmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index 1c54231..297e1f0 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256 a0a42c55935e75a630208e2f70840bd4407f56fe1c5258f5b0f6c0aaedf88cec  libqmi-1.18.0.tar.xz
> +sha256 21428cd3749c56246565123f707fee51238651a22c60bdc85ebce97388626eb4  libqmi-1.20.0.tar.xz
>  sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB

Please check that both of these library files didn't change.

Matt
