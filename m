From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Sep 2015 13:49:36 +0200
Subject: [Buildroot] [PATCH 2/2] ltp-testsuite: don't link with libtirpc
In-Reply-To: <4f342418e3b1c4cb115e13709fe7366ce8ba0db7.1443613129.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 30 Sep 2015 14:38:49 +0300")
References: <5e7ab0a7bf987fa76a167569b823df89144af045.1443613129.git.baruch@tkos.co.il>
 <4f342418e3b1c4cb115e13709fe7366ce8ba0db7.1443613129.git.baruch@tkos.co.il>
Message-ID: <871tdgxh2n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Buildroot patches libtirpc to remove auth_des support. This breaks tirpc test
 > build. Remove support for libtirpc for now.

 > Fixes:
 > http://autobuild.buildroot.net/results/301/3015eee7b1b6b240e7948b08954d273d28f44c32/

 > Cc: Anders Roxell <anders.roxell@linaro.org>
 > Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
