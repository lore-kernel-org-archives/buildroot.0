From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Dec 2019 08:53:11 +0100
Subject: [Buildroot] [PATCH 1/1] configs/linksprite_pcduino: add
 host-openssl for kernel build
In-Reply-To: <20191207113224.2635748-1-geomatsi@gmail.com> (Sergey
 Matyukevich's message of "Sat, 7 Dec 2019 14:32:24 +0300")
References: <20191207113224.2635748-1-geomatsi@gmail.com>
Message-ID: <874kybjlso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Matyukevich <geomatsi@gmail.com> writes:

 > Updated kernel version for pcDuino board requires host-openssl
 > to build successfully. This commit adds the required option:
 >     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y

 > Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/371286142

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
