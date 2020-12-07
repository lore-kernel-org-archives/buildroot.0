From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Dec 2020 22:57:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.66.3
In-Reply-To: <20201123213557.789056-1-mbrunelle@distech-controls.com>
References: <20201123213557.789056-1-mbrunelle@distech-controls.com>
Message-ID: <20201207225750.6d7d0731@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 23 Nov 2020 16:35:57 -0500
Maxime Brunelle via buildroot <buildroot@busybox.net> wrote:

> Fixes https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/524
> package/libglib2 reference: https://gitlab.gnome.org/GNOME/glib/-/issues/2091
> 
> Signed-off-by: Maxime Brunelle <mbrunelle@distech-controls.com>
> ---
>  package/libglib2/0003-remove-cpp-requirement.patch | 2 +-
>  package/libglib2/libglib2.hash                     | 4 ++--
>  package/libglib2/libglib2.mk                       | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
