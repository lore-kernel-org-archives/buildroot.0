From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Sep 2012 12:42:25 +0200
Subject: [Buildroot] [PATCH 1/1] allow to pass the number of parallel
	jobs via command line
In-Reply-To: <20120926062348.GA31527@game.jcrosoft.org> (Jean-Christophe
 PLAGNIOL-VILLARD's message of "Wed, 26 Sep 2012 08:23:48 +0200")
References: <1348568223-13874-1-git-send-email-plagnioj@jcrosoft.com>
 <87txul7sbc.fsf@macbook.be.48ers.dk>
 <20120926062348.GA31527@game.jcrosoft.org>
Message-ID: <87a9wd6p66.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jean-Christophe" == Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com> writes:

Hi,

 >> why not just use make BR2_JLEVEL=x ?

 JC> kconfig overwrite and you can not optarg env as
 JC> BR2_JLEVEL is a int so need to use PARALLEL_JOBS

Sorry, I don't understand what you are saying here. BR2_JLEVEL works
fine:

make BR2_LEVEL=42
...
/usr/bin/make -j42 CC="/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gcc" ..

-- 
Bye, Peter Korsgaard
