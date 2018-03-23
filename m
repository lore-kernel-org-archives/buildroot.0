From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 23 Mar 2018 16:32:54 +0100
Subject: [Buildroot] [PATCH] xfsprogs: fix build with libunistring
In-Reply-To: <06acdda957b792e80ecf80549852bcdf8bf48b19.1521549297.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 20 Mar 2018 14:34:57 +0200")
References: <06acdda957b792e80ecf80549852bcdf8bf48b19.1521549297.git.baruch@tkos.co.il>
Message-ID: <877eq23izd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The latest xfsprogs bump to version 4.15.1 added an optional dependency
 > on libunistring. Make sure we libunistring build before xfsprogs.

s/we libunistring build/we build libunistring/

Committed, thanks.

-- 
Bye, Peter Korsgaard
