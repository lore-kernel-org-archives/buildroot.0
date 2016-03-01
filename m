From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Mar 2016 12:55:24 +0100
Subject: [Buildroot] [PATCH] zsh: use the correct target pcre-config
In-Reply-To: <5e05faec7b46f08ff3dc732b002a22de706519d8.1456832095.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 1 Mar 2016 13:34:55 +0200")
References: <5e05faec7b46f08ff3dc732b002a22de706519d8.1456832095.git.baruch@tkos.co.il>
Message-ID: <87twkql8er.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > zsh configure script mis-detects the location of pcre-config, and may use that
 > of host-pcre or that of the host instead of the target. Make configure use the
 > correct pcre-config.

 > Thanks to Thomas Petazzoni for pointing me at the right direction.

 > Fixes:
 > http://autobuild.buildroot.net/results/b12/b12aadf3016dab0941cae780fa9ee7bf9be8fcda/
 > http://autobuild.buildroot.net/results/8e8/8e8b12dbca4ef8cac2e5f33cd3cdcddd8e849840/
 > http://autobuild.buildroot.net/results/473/473197ec8e323ea7ae0e29e6363525dc42f9da2c/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
