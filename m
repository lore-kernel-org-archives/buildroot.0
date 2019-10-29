From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Oct 2019 11:51:12 +0100
Subject: [Buildroot] [PATCH] package/sudo: security bump to version
 1.8.28
In-Reply-To: <2706c5c37be3187c1e6505441c2fba2767b33f15.1571122747.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 15 Oct 2019 09:59:07 +0300")
References: <2706c5c37be3187c1e6505441c2fba2767b33f15.1571122747.git.baruch@tkos.co.il>
Message-ID: <87ftjb6d0f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2019-14287: a sudo user may be able to run a command as root
 > when the Runas specification explicitly disallows root access as long as
 > the ALL keyword is listed first.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
