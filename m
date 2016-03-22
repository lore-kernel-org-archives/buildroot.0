From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 21:43:29 +0100
Subject: [Buildroot] [PATCH 1/2] package/quota: renumber patches
In-Reply-To: <1453573714-19731-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453573714-19731-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160322214329.1ae8cddf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jan 2016 19:28:33 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../{01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch}    | 0
>  .../quota/{02-fix-static-linking.patch => 0002-fix-static-linking.patch}  | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename package/quota/{01-tools-getrpcbynumber.patch => 0001-tools-getrpcbynumber.patch} (100%)
>  rename package/quota/{02-fix-static-linking.patch => 0002-fix-static-linking.patch} (100%)

Not terribly useful by itself without the following musl patch, but
I've applied it to master nonetheless since it was pending. For the musl
patch, could you respin after fixing the global comments that I did on
all your musl patches?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
