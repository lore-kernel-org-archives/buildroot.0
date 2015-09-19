From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 14:20:20 +0200
Subject: [Buildroot] [PATCH] kompexsqlite: new package
In-Reply-To: <1442267115-2530-1-git-send-email-gustavo@zacarias.com.ar>
References: <1442267115-2530-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150919142020.269fe9f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 14 Sep 2015 18:45:15 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/Config.in                                  |  1 +
>  ...kefile-use-autoconf-CXX-for-proper-builds.patch | 27 ++++++++++++++++++++++
>  package/kompexsqlite/Config.in                     | 12 ++++++++++
>  package/kompexsqlite/kompexsqlite.hash             |  2 ++
>  package/kompexsqlite/kompexsqlite.mk               | 14 +++++++++++
>  5 files changed, 56 insertions(+)
>  create mode 100644 package/kompexsqlite/0001-Makefile-use-autoconf-CXX-for-proper-builds.patch
>  create mode 100644 package/kompexsqlite/Config.in
>  create mode 100644 package/kompexsqlite/kompexsqlite.hash
>  create mode 100644 package/kompexsqlite/kompexsqlite.mk

I've applied, thanks!

One thing that I wasn't sure about: the location in "Databases", and
not somewhere under "Libraries". Because kompexsqlite is really only a
library. But it's true that the sqlite package is also under
"Databases" and even if it provides a sqlite3 command line tool, sqlite
is mainly useful as a library.

So I've kept kompexsqlite with the other databases packages for now. If
some people disagree, we can change it later.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
