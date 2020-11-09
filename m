From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Nov 2020 21:04:44 +0100
Subject: [Buildroot] [PATCH] package/stress-ng: disable libbsd on static
 build
In-Reply-To: <dc3cb1b01e9ab89ae86079f39b6b043bdea1f709.1604938688.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 9 Nov 2020 18:18:08 +0200")
References: <dc3cb1b01e9ab89ae86079f39b6b043bdea1f709.1604938688.git.baruch@tkos.co.il>
Message-ID: <87v9ees3dv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Static link with libbsd fails because of multiple definition of the
 > strlcpy symbol. uClibc optionally provides these symbols.

 > Add make options that disable all libbsd tests when linking statically.

 > Fixes:
 > http://autobuild.buildroot.net/results/2c77271b33c9d0e9a39cced2eda6d0df0d6b8124/
 > http://autobuild.buildroot.net/results/2f98c5d9ca907dd62b30bedfe4e52b014bb3e8d1/
 > http://autobuild.buildroot.net/results/51c4c065b93a6d11f6b4583f80f932481518905a/

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
