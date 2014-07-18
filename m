From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Jul 2014 10:51:54 +0200
Subject: [Buildroot] [PATCH 1/3] Add $$(PKG)_AUTORECONF_ENV argument to
 autotools package autoreconf command to allow environment variables to be
 used.
In-Reply-To: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
References: <1405672963-16069-1-git-send-email-rick.taylor@cassidian.com>
Message-ID: <20140718105154.72c05a4f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rick Taylor,

On Fri, 18 Jul 2014 09:42:41 +0100, Rick Taylor wrote:
> Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
> ---
>  package/pkg-autotools.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks. However, the commit log is not properly formatted. With git,
the commit log should have one line of less than ~80 characters that
summarizes the commit, then one empty new line, and then more details.
Also, in Buildroot, we like when the commit title has a prefix that
identifies the area of the change. I.e, in your case, something like:

===
pkg-autotools: add support for <pkg>_AUTORECONF_ENV

This commit improves the autotools-package infrastructure to support a
<pkg>_AUTORECONF_ENV variable, which allows to pass addition variables
in the environment of the autoreconf execution. This is useful in the
situation where blabla blibli ...

Signed-off-by: ...
===

Could you update your commit log with this format?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
