From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Apr 2019 15:57:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/neardal: bump to version
 4143d130ed39299bfc59d08d2c7c77dbc7f809e9
In-Reply-To: <20190418144542.24410-1-fontaine.fabrice@gmail.com>
References: <20190418144542.24410-1-fontaine.fabrice@gmail.com>
Message-ID: <20190420155746.44d7c845@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 18 Apr 2019 16:45:42 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove patch (already in version)
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...tic-linking-with-libedit-or-readline.patch | 45 -------------------
>  package/neardal/neardal.hash                  |  3 +-
>  package/neardal/neardal.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 47 deletions(-)
>  delete mode 100644 package/neardal/0001-fix-static-linking-with-libedit-or-readline.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
