From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 22:58:58 +1300
Subject: [Buildroot] [PATCH 1/2] efl: fix target package dependency on
 util-linux (libmount).
In-Reply-To: <20170103212932.9254-2-barbieri@profusion.mobi>
References: <20170103212932.9254-1-barbieri@profusion.mobi>
 <20170103212932.9254-2-barbieri@profusion.mobi>
Message-ID: <20170128225858.3578f663@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Jan 2017 19:29:31 -0200, Gustavo Sverzut Barbieri wrote:
> use the correct variable (BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT) and do
> not impose dependency on util-linux if not needed.
> 
> Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
> ---
>  package/efl/Config.in | 6 +++---
>  package/efl/efl.mk    | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
