From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 08:49:50 +0100
Subject: [Buildroot] [pkg-luarocks infra V3 08/10] luasql-sqlite3:
 renamed like with LuaRocks
In-Reply-To: <1384460249-32410-8-git-send-email-francois.perrad@gadz.org>
References: <1384460249-32410-1-git-send-email-francois.perrad@gadz.org>
 <1384460249-32410-8-git-send-email-francois.perrad@gadz.org>
Message-ID: <CAAXf6LUwdsoRLR4_MV6mRQY3pf2xXvrAktkckak32D5o0KvFuw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Francois,

On Thu, Nov 14, 2013 at 9:17 PM, Francois Perrad <fperrad@gmail.com> wrote:
>
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  Config.in.legacy                         |    7 ++++++
>  package/Config.in                        |    2 +-
>  package/luasql-sqlite3/Config.in         |    8 +++++++
>  package/luasql-sqlite3/luasql-sqlite3.mk |   33 ++++++++++++++++++++++++++
>  package/luasql/Config.in                 |   22 -----------------
>  package/luasql/luasql.mk                 |   38 ------------------------------
>  6 files changed, 49 insertions(+), 61 deletions(-)
>  create mode 100644 package/luasql-sqlite3/Config.in
>  create mode 100644 package/luasql-sqlite3/luasql-sqlite3.mk
>  delete mode 100644 package/luasql/Config.in
>  delete mode 100644 package/luasql/luasql.mk
>

How have you moved this file? I don't see any indication of a
git-aware move, it seems to be an independent delete+add...

Best regards,
Thomas
