From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:41:10 +0200
Subject: [Buildroot] [PATCH 1/2] bind: fix build with openssl
In-Reply-To: <f6a81f45eeaea33eaa9015355bd7c63779f7b881.1531939984.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 18 Jul 2018 21:53:03 +0300")
References: <f6a81f45eeaea33eaa9015355bd7c63779f7b881.1531939984.git.baruch@tkos.co.il>
Message-ID: <87tvouaop5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > The bind configure.in uses AC_TRY_RUN that is not compatible with cross
 > compile. Disable eddsa unconditionally since it requires a newer OpenSSL
 > version than we currently have. Enable aes; this is always supported in
 > current OpenSSL versions.

 > Fixes:
 > http://autobuild.buildroot.net/results/3ed/3edb1659954b00401b68ffc7e1c8b3c29581c0e4/
 > http://autobuild.buildroot.net/results/025/025e377b51b39ba34647636ad0d0661a3cb95572/
 > http://autobuild.buildroot.net/results/725/7250564e780e43e793ae6c8c526985e5519681f4/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
