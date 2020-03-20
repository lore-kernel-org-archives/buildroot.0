From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 20 Mar 2020 23:03:50 +0100
Subject: [Buildroot] [Resend] package/lua-lyaml: new package
In-Reply-To: <20200311070931.6271-1-francois.perrad@gadz.org>
References: <20200311070931.6271-1-francois.perrad@gadz.org>
Message-ID: <20200320230350.269a85e1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 11 Mar 2020 08:09:31 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  .gitlab-ci.yml                                |  2 ++
>  package/Config.in                             |  1 +
>  package/lua-lyaml/Config.in                   |  9 +++++
>  package/lua-lyaml/lua-lyaml.hash              |  3 ++
>  package/lua-lyaml/lua-lyaml.mk                | 33 +++++++++++++++++++
>  .../testing/tests/package/test_lua_lyaml.py   | 27 +++++++++++++++
>  6 files changed, 75 insertions(+)
>  create mode 100644 package/lua-lyaml/Config.in
>  create mode 100644 package/lua-lyaml/lua-lyaml.hash
>  create mode 100644 package/lua-lyaml/lua-lyaml.mk
>  create mode 100644 support/testing/tests/package/test_lua_lyaml.py

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
