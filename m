From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2021 20:33:45 +0100
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{4,
 10}.x 4.{4, 9, 14, 19} series
In-Reply-To: <20210206115319.1442990-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 6 Feb 2021 12:53:19 +0100")
References: <20210206115319.1442990-1-bernd.kuhls@t-online.de>
Message-ID: <871rdnlnty.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Please note that the bump of kernel 4.4 and 4.9 to 4.x.256 can cause
 > problems:

 > https://lkml.org/lkml/2021/2/5/747
 > https://cdn.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.4.256

 > https://lkml.org/lkml/2021/2/5/862
 > https://cdn.kernel.org/pub/linux/kernel/v4.x/ChangeLog-4.9.256

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.02.x and 2020.11.x except for the 5.10.x bump (and
sticking to 4.4.255 / 4.9.255), thanks.

-- 
Bye, Peter Korsgaard
