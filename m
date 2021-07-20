From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 20:27:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: disable urlify unless
 supported
In-Reply-To: <20210720152559.129171-1-james.hilliard1@gmail.com>
References: <20210720152559.129171-1-james.hilliard1@gmail.com>
Message-ID: <20210720202700.54138125@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 20 Jul 2021 09:25:59 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> The urlify feature in the systemd pager is only supported by the full
> less package and not busybox less, enable only for builds with full
> less support.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...1-Add-meson-option-to-disable-urlify.patch | 67 +++++++++++++++++++
>  package/systemd/systemd.mk                    |  6 ++
>  2 files changed, 73 insertions(+)
>  create mode 100644 package/systemd/0001-Add-meson-option-to-disable-urlify.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
