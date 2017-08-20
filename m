From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 20 Aug 2017 10:01:31 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/lzo: bump version to 2.10
References: <20170805093042.481-1-bernd.kuhls@t-online.de>
 <59990a7155c81_50eefe8043078d@ultri3.mail>
Message-ID: <r7sn6ex8gp.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 20 Aug 2017 01:05:05 -0300 schrieb Ricardo Martincoski:

> This bump seems to cause build failures for some configurations. See
> https://gitlab.com/buildroot.org/buildroot/-/jobs/29048112 You can
> download the build log (that also contains the defconfig) using the
> button on the right of the screen.
> 
> I can reproduce it locally using the current NEXT branch.
> 
> $ git checkout cdad2823a3e853daf43ccb1da03c96e75ba2dab7 # next $
> support/testing/run-tests -d d -o o tests.fs.test_jffs2.TestJffs2 build
> fails

Hi,

please try http://patchwork.ozlabs.org/patch/803654/

Regards, Bernd
