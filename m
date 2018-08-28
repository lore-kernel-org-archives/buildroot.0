From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 13:18:58 +0200
Subject: [Buildroot] [PATCH] libsoup: security bump to version 2.62.3
In-Reply-To: <b3371f0ae3c4c91fc17182950ecaf97879d7da34.1535448446.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 28 Aug 2018 12:27:26 +0300")
References: <b3371f0ae3c4c91fc17182950ecaf97879d7da34.1535448446.git.baruch@tkos.co.il>
Message-ID: <87zhx668nx.fsf@dell.be.48ers.dk>
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

Thanks! I started looking at this myself, but got sidetracked.

Is 2.62.x the first release containing this fix? Should we also cherry
pick this for 2018.02.x / 2018.05.x or is there a smaller patch that
could be applied instead?

-- 
Bye, Peter Korsgaard
