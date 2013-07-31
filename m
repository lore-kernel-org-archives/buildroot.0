From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:08:42 +0200
Subject: [Buildroot] [PATCH] libedit: really needs wchar support
In-Reply-To: <1375289757-23151-1-git-send-email-gustavo@zacarias.com.ar>
References: <1375289757-23151-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20130731190842.51b83cc0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 13:55:57 -0300, Gustavo Zacarias wrote:
> wctype.h is always included, even in configure tests.
> Fixes:
> http://autobuild.buildroot.net/results/ed8/ed85b9d688ad8389895e3ecd7a6a18151efc328d/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libedit/Config.in  | 4 ++++
>  package/libedit/libedit.mk | 7 -------
>  2 files changed, 4 insertions(+), 7 deletions(-)

As suggested by Yann on IRC, I'll wait for a version that adds a
--enable-widec to LIBEDIT_CONF_OPT.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
