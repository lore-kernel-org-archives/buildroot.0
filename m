From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 15:18:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: resiprocate-apps
 need openssl
In-Reply-To: <20210117100612.1210505-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 17 Jan 2021 11:06:12 +0100")
References: <20210117100612.1210505-1-bernd.kuhls@t-online.de>
Message-ID: <8735yxdn7t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/7ac/7ac82a3ac4b06cb5ad44e92548d66a0f79d149a6/

 > In file included from Server.cxx:19:
 > ../../resip/stack/ssl/Security.hxx:32:10: fatal error: openssl/ssl.h: No such file or directory

 > clicktoall needs openssl:
 > https://github.com/resiprocate/resiprocate/blob/resiprocate-1.12/apps/clicktocall/Makefile.am#L16

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
