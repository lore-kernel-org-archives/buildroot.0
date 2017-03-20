From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Mar 2017 16:29:29 +0100
Subject: [Buildroot] [PATCH] wget: add upstream security fix
In-Reply-To: <f1cb9b28fe905f86a49974189ff906fc277e61c8.1489983416.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 20 Mar 2017 06:16:56 +0200")
References: <f1cb9b28fe905f86a49974189ff906fc277e61c8.1489983416.git.baruch@tkos.co.il>
Message-ID: <87bmswm0fa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-6508: CRLF injection in the url_parse function in url.c
 > http://lists.gnu.org/archive/html/bug-wget/2017-03/msg00018.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
