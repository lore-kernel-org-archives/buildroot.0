From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:03:31 +0100
Subject: [Buildroot] [PATCH v2] acpid: Add systemd service
In-Reply-To: <20181113201728.19936-1-alexander.sverdlin@gmail.com>
References: <20181113201728.19936-1-alexander.sverdlin@gmail.com>
Message-ID: <20181113220331.45071621@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 21:17:28 +0100, Alexander Sverdlin wrote:
> This one is based on Archlinux's service file.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  package/acpid/acpid.mk      | 8 ++++++++
>  package/acpid/acpid.service | 9 +++++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 package/acpid/acpid.service

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
