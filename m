From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jan 2017 20:59:08 +1300
Subject: [Buildroot] [PATCH 1/1] ucl: Use -std=iso9899:1990 instead of
 -std=c90
In-Reply-To: <20170125192020.27140-1-stilor@att.net>
References: <20170125192020.27140-1-stilor@att.net>
Message-ID: <20170126205908.503b03bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 25 Jan 2017 11:20:20 -0800, Alexey Neyman wrote:
> The shorter alias, -std=c90, is not known by older versions of GCC.
> See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=20631.
> 
> Signed-off-by: Alexey Neyman <stilor@att.net>
> ---
>  package/ucl/ucl.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
