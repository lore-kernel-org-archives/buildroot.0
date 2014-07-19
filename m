From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 12:17:05 +0200
Subject: [Buildroot] [PATCH] dejavu: new package
In-Reply-To: <1401916064-11345-1-git-send-email-ps.report@gmx.net>
References: <1401916064-11345-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140719121705.5ec7c8ef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Wed,  4 Jun 2014 23:07:44 +0200, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/Config.in        |  1 +
>  package/dejavu/Config.in | 33 +++++++++++++++++++++++++
>  package/dejavu/dejavu.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 97 insertions(+)
>  create mode 100644 package/dejavu/Config.in
>  create mode 100644 package/dejavu/dejavu.mk

I've applied your patch, after refactoring how the installation is
done, and changing a little bit the package so that the fontconfig
files are only installed when the fontconfig package is enabled.

See
http://git.buildroot.net/buildroot/commit/?id=8390d939f87581bc216897e6ecd2fded968d5b50
for the commit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
