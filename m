From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 18:25:25 +0200
Subject: [Buildroot] [PATCH] package/luasyslog: new package
In-Reply-To: <20190612190928.30403-1-francois.perrad@gadz.org>
References: <20190612190928.30403-1-francois.perrad@gadz.org>
Message-ID: <20190620182525.77615271@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 12 Jun 2019 21:09:28 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                             |  1 +
>  package/luasyslog/0001-compat-Lua-5.3.patch   | 52 +++++++++++++++++++
>  package/luasyslog/Config.in                   |  7 +++
>  package/luasyslog/luasyslog.hash              |  3 ++
>  package/luasyslog/luasyslog.mk                | 11 ++++
>  .../testing/tests/package/test_luasyslog.py   | 25 +++++++++
>  6 files changed, 99 insertions(+)
>  create mode 100644 package/luasyslog/0001-compat-Lua-5.3.patch
>  create mode 100644 package/luasyslog/Config.in
>  create mode 100644 package/luasyslog/luasyslog.hash
>  create mode 100644 package/luasyslog/luasyslog.mk
>  create mode 100644 support/testing/tests/package/test_luasyslog.py

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
