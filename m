From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 13:24:50 -0300
Subject: [Buildroot] [PATCH 2/7 v4] download/git: run all git commands
 in the current directory
References: <e9e13e7990239cba69b9cf8e626cbe64180be4dc.1524944063.git.yann.morin.1998@free.fr>
Message-ID: <5ae5f1d2abd72_7b93fdaad4288cc88328@ultri4.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Apr 28, 2018 at 04:34 PM, Yann E. MORIN wrote:

> That way, we can pushd earlier, which will help with last-ditch recovery
> in a followup commit.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
[with patches until this one applied: works with empty, broken (by removing
 .git/HEAD) or pre-existing git cache using git versions 1.7.1, 1.8.3, 2.11.0,
 2.14.1]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
