From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Jun 2016 22:47:23 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/boost: boost-metaparse
	depends on boost-test
In-Reply-To: <1466328169-12236-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 19 Jun 2016 11:22:49 +0200")
References: <1466328169-12236-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87a8if1tb8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The boost metaparse library depends on the test library:
 > https://github.com/boostorg/metaparse/blob/master/build/Jamfile.v2

 > The test library itself depends on MMU, therefore we need to propagate
 > the dependency, fixes

 > http://autobuild.buildroot.net/results/02f/02f98a50340ecae01f723ad48c2d54d9e28388f8/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: added blank line above s-o-b


Committed, thanks.

-- 
Bye, Peter Korsgaard
