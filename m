From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 22 Jul 2017 20:51:19 -0300
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: fix syntax
References: <20170722214728.31536-1-yann.morin.1998@free.fr>
Message-ID: <5973e4f7a6b8f_5cfd3fe2689a0cd880d@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jul 22, 2017 at 06:47 PM, Yann E. MORIN wrote:

> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[make defconfig: without the patch I get
 package/kvm-unit-tests/Config.in:5: syntax error
 package/kvm-unit-tests/Config.in:4: invalid option
 and the patch fixes it]
Tested-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Regards,
Ricardo
