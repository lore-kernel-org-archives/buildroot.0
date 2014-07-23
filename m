From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:49:49 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-autotools: add support for
 <pkg>_AUTORECONF_ENV
In-Reply-To: <1405674739-17167-1-git-send-email-rick.taylor@cassidian.com>
References: <1405674739-17167-1-git-send-email-rick.taylor@cassidian.com>
Message-ID: <20140723234949.1fbd0a9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rick Taylor,

On Fri, 18 Jul 2014 10:12:19 +0100, Rick Taylor wrote:
> This commit improves the autotools-package infrastructure to support a <pkg>_AUTORECONF_ENV variable, which allows a package maintainer to pass additional variables in the environment of the autoreconf execution. This is useful in the situation where configure.ac contains shell commands using environment variables that are only executed when autoreconf is run.
> 
> Signed-off-by: Rick Taylor <rick.taylor@cassidian.com>
> ---
>  docs/manual/adding-packages-autotools.txt | 5 +++++
>  package/pkg-autotools.mk                  | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)

Thanks, applied, after wrapping the commit log text.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
