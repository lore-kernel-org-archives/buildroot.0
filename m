From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Jun 2020 23:27:43 +0200
Subject: [Buildroot] [PATCH v1] package/libv4l: bump version to 1.20.0
In-Reply-To: <20200602205918.23842-1-ps.report@gmx.net>
References: <20200602205918.23842-1-ps.report@gmx.net>
Message-ID: <20200602232743.65dfd936@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  2 Jun 2020 22:59:18 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> - removed 0002-keytable-use-input_event-properly.patch
>   (upstream [1])
> 
> - removed 0003-keytable-add-compatibility-for-input_event_sec.patch
>   (upstream [2])
> 
> [1] https://git.linuxtv.org/v4l-utils.git/patch/?id=38f4ce74275ae4625463f7eec78764715a0b6246
> [2] https://git.linuxtv.org/v4l-utils.git/patch/?id=8b7e6ce9367fe09ca9398b5f3cc75bba2598b162
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...02-keytable-use-input_event-properly.patch | 36 -------------------
>  ...dd-compatibility-for-input_event_sec.patch | 35 ------------------
>  package/libv4l/libv4l.hash                    | 10 +++---
>  package/libv4l/libv4l.mk                      |  2 +-
>  4 files changed, 6 insertions(+), 77 deletions(-)
>  delete mode 100644 package/libv4l/0002-keytable-use-input_event-properly.patch
>  delete mode 100644 package/libv4l/0003-keytable-add-compatibility-for-input_event_sec.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
