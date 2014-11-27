From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 27 Nov 2014 18:13:56 -0500
Subject: [Buildroot] [PATCHv2 54/74] busybox: install init script
	unconditionally
In-Reply-To: <1417125452-18705-55-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417125452-18705-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417125452-18705-55-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CANxTyt6E1mVczzkJMKBSvFFQy37pDTXigtS1GX1QcRhNOJo1Bw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Nov 27, 2014 at 4:57 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> As discussed, users should use a rootfs overlay or a post-build script
> instead of a custom skeleton to override files installed by Buildroot,
> so there is no point in having conditions when installing init scripts
> or configuration files.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/dmraid/dmraid.mk | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/package/dmraid/dmraid.mk b/package/dmraid/dmraid.mk
> index 024b9b5..a6ed57f 100644
> --- a/package/dmraid/dmraid.mk
> +++ b/package/dmraid/dmraid.mk

Subject says "busybox", but should be "dmraid"?

Danomi -
