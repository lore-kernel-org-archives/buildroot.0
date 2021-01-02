From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:25:24 +0100
Subject: [Buildroot] [PATCH 5/5] package/datatables-responsive: new
 package
In-Reply-To: <20201208180529.9152-5-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
 <20201208180529.9152-5-patrickdepinguin@gmail.com>
Message-ID: <20210102122524.2217b641@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Dec 2020 19:05:28 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/datatables-responsive/Config.in       | 12 ++++++++++
>  .../datatables-responsive.hash                |  3 +++
>  .../datatables-responsive.mk                  | 23 +++++++++++++++++++
>  5 files changed, 40 insertions(+)
>  create mode 100644 package/datatables-responsive/Config.in
>  create mode 100644 package/datatables-responsive/datatables-responsive.hash
>  create mode 100644 package/datatables-responsive/datatables-responsive.mk

Applied to master with the same "move files to $(@D" change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
