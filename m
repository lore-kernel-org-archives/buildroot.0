From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Dec 2020 15:16:37 +0100
Subject: [Buildroot] [PATCH] package/lualdap: new package
In-Reply-To: <20201220135514.251951-1-francois.perrad@gadz.org>
References: <20201220135514.251951-1-francois.perrad@gadz.org>
Message-ID: <20201231151637.67048734@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 20 Dec 2020 14:55:14 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                             |  1 +
>  package/lualdap/Config.in                     | 15 +++++++++
>  package/lualdap/lualdap.hash                  |  3 ++
>  package/lualdap/lualdap.mk                    | 33 +++++++++++++++++++
>  support/testing/tests/package/test_lualdap.py | 25 ++++++++++++++
>  5 files changed, 77 insertions(+)
>  create mode 100644 package/lualdap/Config.in
>  create mode 100644 package/lualdap/lualdap.hash
>  create mode 100644 package/lualdap/lualdap.mk
>  create mode 100644 support/testing/tests/package/test_lualdap.py

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
