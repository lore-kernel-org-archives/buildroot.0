From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 21:39:40 +0200
Subject: [Buildroot] [PATCH 1/2] triggerhappy: use target pkg-config
In-Reply-To: <d94eeb035e53af51d450c8e49b03e01cce0dfa1a.1528741488.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 11 Jun 2018 21:24:47 +0300")
References: <d94eeb035e53af51d450c8e49b03e01cce0dfa1a.1528741488.git.baruch@tkos.co.il>
Message-ID: <87y3flcdtv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > triggerhappy uses pkg-config to detect the systemd library. Make sure it
 > uses the target pkg-config, not the host one.

 > Fixes build failure when the host has systemd pkg-config files:

 > .../host/bin/arm-linux-gcc -static  th-cmd.o cmdsocket.o  -lsystemd -o th-cmd
 > .../host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/6.4.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > cannot find -lsystemd

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
