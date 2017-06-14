From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 21:51:12 +0200
Subject: [Buildroot] [PATCH 1/2] gnutls: security bump to version 3.5.13
In-Reply-To: <629c7b2bda5194692d4508ec53cb3502cffd285b.1497464315.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Wed, 14 Jun 2017 21:18:34 +0300")
References: <629c7b2bda5194692d4508ec53cb3502cffd285b.1497464315.git.baruch@tkos.co.il>
Message-ID: <87poe6jqkv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2017-7507: decoding a status request TLS extension that has a
 > non-empty responder IDs list could lead to a crash due to a null pointer
 > dereference.

 > https://lists.gnupg.org/pipermail/gnutls-devel/2017-June/008446.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed both to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
