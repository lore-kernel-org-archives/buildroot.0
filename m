From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:01:59 +0200
Subject: [Buildroot] [PATCH] znc: fix build without openssl
In-Reply-To: <c809ed2649c492c5cd3bd30fd9d50c38858fe7c7.1528657762.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 10 Jun 2018 22:09:22 +0300")
References: <c809ed2649c492c5cd3bd30fd9d50c38858fe7c7.1528657762.git.baruch@tkos.co.il>
Message-ID: <874li9ccso.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch to include <memory> unconditionally.
 > Fixes:
 > http://autobuild.buildroot.net/results/4c3/4c3d9f6f5214052b7eda4c7bbfabe5b463080b12/
 > http://autobuild.buildroot.net/results/d06/d06176f00109ad0707032b0d76fe94f1d414106c/

 > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
