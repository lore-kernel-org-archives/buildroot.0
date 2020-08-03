From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Aug 2020 23:05:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/wayland: fix build with
 toolchains without c++
In-Reply-To: <20200729181650.6949-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 29 Jul 2020 20:16:50 +0200")
References: <20200729181650.6949-1-bernd.kuhls@t-online.de>
Message-ID: <87mu3bsani.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 > http://autobuild.buildroot.net/results/fb2/fb205601cac2bbf8e70ec2bf4eaf22264d8edc96/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I see that this breaks the tests, so the final solution will presumably
look differently.

With that said, we need a fix - So I've applied it for now, thanks.

-- 
Bye, Peter Korsgaard
