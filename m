From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:12:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libtelnet: new package
In-Reply-To: <20191220134436.15392-1-patrickdepinguin@gmail.com>
References: <20191220134436.15392-1-patrickdepinguin@gmail.com>
Message-ID: <20191222111258.0fa77c39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 20 Dec 2019 14:44:36 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  DEVELOPERS                                    |  1 +
>  package/Config.in                             |  1 +
>  .../0001-fix-compilation-without-zlib.patch   | 43 +++++++++++++++++++
>  package/libtelnet/Config.in                   | 10 +++++
>  package/libtelnet/libtelnet.hash              |  3 ++
>  package/libtelnet/libtelnet.mk                | 18 ++++++++
>  6 files changed, 76 insertions(+)
>  create mode 100644 package/libtelnet/0001-fix-compilation-without-zlib.patch
>  create mode 100644 package/libtelnet/Config.in
>  create mode 100644 package/libtelnet/libtelnet.hash
>  create mode 100644 package/libtelnet/libtelnet.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
