From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 15:44:24 +0200
Subject: [Buildroot] [PATCH] libsoup: add upstream security fix
In-Reply-To: <bbf534b677a8ad046569a43f6e06bf41b708c957.1535459777.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 Aug 2018 15:36:17 +0300")
References: <bbf534b677a8ad046569a43f6e06bf41b708c957.1535459777.git.baruch@tkos.co.il>
Message-ID: <87r2ii61xj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2018-12910: The get_cookies function in soup-cookie-jar.c in
 > libsoup 2.63.2 allows attackers to have unspecified impact via an empty
 > hostname.

 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to master, 2018.05.x and 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
