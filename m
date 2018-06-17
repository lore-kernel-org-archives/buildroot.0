From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 16:55:17 +0200
Subject: [Buildroot] [PATCH 1/4] nfs-utils: add host package
In-Reply-To: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 18 May 2018 14:31:56 +0300")
References: <4b1f3623de3a8a4386f76d0f3cdd36b7c9b230dd.1526643119.git.baruch@tkos.co.il>
Message-ID: <87a7rtv4x6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > We only need the host package for the rpcgen utility. glibc deprecated
 > this utility in version 2.26. Fedora has recently removed rpcgen from
 > its glibc package. So we need to build the rpcgen from the nfs-utils
 > package.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
