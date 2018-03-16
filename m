From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Mar 2018 10:35:21 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: bump to version 5.49
In-Reply-To: <20180314215828.18789-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Wed, 14 Mar 2018 22:58:28 +0100")
References: <20180314215828.18789-1-joerg.krause@embedded.rocks>
Message-ID: <87tvtggy7a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > Drop musl patch, which is not necessary anymore as netinet vs linux
 > header clash is fixed.

 > Also add hash for the license files.

 > musl build successfully tested with:
 >  * armv7-eabihf--musl--stable-2017.05-toolchains-1-1
 >    (GCC 5.4.0, Linux headers 3.10.105, musl 1.1.16)
 >  * armv7-eabihf--musl--bleeding-edge-2018.02-1
 >    (GCC 7.3.0, Linux headers 4.9.80, musl 1.1.18)

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Committed, thanks.

-- 
Bye, Peter Korsgaard
