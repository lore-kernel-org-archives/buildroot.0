From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 12:22:27 +0100
Subject: [Buildroot] [PATCH 4/5] package/datatables-fixedcolumns: new
 package
In-Reply-To: <20201208180529.9152-4-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
 <20201208180529.9152-4-patrickdepinguin@gmail.com>
Message-ID: <20210102122227.197f69ec@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  8 Dec 2020 19:05:27 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  package/datatables-fixedcolumns/Config.in     | 10 ++++++++
>  .../datatables-fixedcolumns.hash              |  3 +++
>  .../datatables-fixedcolumns.mk                | 23 +++++++++++++++++++
>  5 files changed, 38 insertions(+)
>  create mode 100644 package/datatables-fixedcolumns/Config.in
>  create mode 100644 package/datatables-fixedcolumns/datatables-fixedcolumns.hash
>  create mode 100644 package/datatables-fixedcolumns/datatables-fixedcolumns.mk

Applied to master with the same "move files to $(@D)" change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
