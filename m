From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Jul 2020 09:45:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to
 version 2.2.0
In-Reply-To: <20200720205019.2100604-1-fontaine.fabrice@gmail.com>
References: <20200720205019.2100604-1-fontaine.fabrice@gmail.com>
Message-ID: <20200721094542.0b58643b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Jul 2020 22:50:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-15103 - Integer overflow due to missing input sanitation in
> rdpegfx channel
> 
> https://github.com/FreeRDP/FreeRDP/releases/tag/2.2.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/freerdp/freerdp.hash | 4 ++--
>  package/freerdp/freerdp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
