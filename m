From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:25:00 +0200
Subject: [Buildroot] [PATCH] package/libqmi: bump to 1.24.14
In-Reply-To: <20200603112803.9519-1-matthew.weber@rockwellcollins.com>
References: <20200603112803.9519-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200604232500.465853b9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  3 Jun 2020 06:28:03 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

>  * libqmi-glib:
>    ** Fix build with GLib < 2.44.
>    ** Fix UTF-8 string validation when the string contains a trailing NUL byte
>       (e.g. the Sierra specific "DMS Swi Get Current Firmware" command).
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/libqmi/libqmi.hash | 2 +-
>  package/libqmi/libqmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
