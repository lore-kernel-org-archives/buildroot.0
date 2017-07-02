From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 17:04:31 +0200
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version 1.7.8
In-Reply-To: <21e15290feb7138acb60802800e8fbb4c12d4a62.1498835094.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 30 Jun 2017 18:04:54 +0300")
References: <21e15290feb7138acb60802800e8fbb4c12d4a62.1498835094.git.baruch@tkos.co.il>
Message-ID: <87mv8mc22o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > From the NEWS file:
 > - Mitigate a flush+reload side-channel attack on RSA secret keys
 >   dubbed "Sliding right into disaster".  For details see
 >   <https://eprint.iacr.org/2017/627>.  [CVE-2017-7526]

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
