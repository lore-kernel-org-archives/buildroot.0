From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Jul 2017 23:26:29 +0200
Subject: [Buildroot] [PATCH] expat: security bump to version 2.2.2
In-Reply-To: <f7cbc676f11d7e779db03578d9fcffd7c34f39d3.1500226905.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Sun, 16 Jul 2017 20:41:45 +0300")
References: <f7cbc676f11d7e779db03578d9fcffd7c34f39d3.1500226905.git.baruch@tkos.co.il>
Message-ID: <87a8448456.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Changes (security fixes):
 > [MOX-006]      Fix non-NULL parser parameter validation in XML_Parse;
 >                  resulted in NULL dereference, previously

 > Drop upstream patch.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
