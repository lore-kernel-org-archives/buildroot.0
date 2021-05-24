From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Mon, 24 May 2021 07:11:23 +0300
Subject: [Buildroot] [PATCH v2] toolchain: remove binutils bug 21464
In-Reply-To: <20210521140942.3032331-1-giulio.benetti@benettiengineering.com>
References: <20210521140942.3032331-1-giulio.benetti@benettiengineering.com>
Message-ID: <538eae52-8c77-49c0-9c5f-ced31988e3ec@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.05.2021 17:09, Giulio Benetti wrote:
> This bug has been fixed upstream and backported to buildroot binutils
> package. So let's remove it from toolchain/Config.in and from packages
> that are affected by it:
> - libgeos
> - postgis
> - protobuf
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * squashed 4 different patches into one
> ---
>   package/libgeos/Config.in  | 4 +---
>   package/postgis/Config.in  | 4 +---
>   package/protobuf/Config.in | 1 -
>   toolchain/Config.in        | 6 ------
>   4 files changed, 2 insertions(+), 13 deletions(-)

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
