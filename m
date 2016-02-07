From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:00:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/wipe: fix musl build
In-Reply-To: <1454273054-8087-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454273054-8087-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160207150050.2e04a7e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 31 Jan 2016 21:44:14 +0100, Bernd Kuhls wrote:
> The build error was not yet found by the autobuilders:
> 
> In file included from main.c:46:0:
> rand.h:31:9: error: unknown type name ?u_int32_t?
>  typedef u_int32_t u_rand_t;
>          ^
> <builtin>: recipe for target 'main.o' failed
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/wipe/0001-musl.patch | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/wipe/0001-musl.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
