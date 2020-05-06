From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:03:52 +0200
Subject: [Buildroot] [PATCH] package/libssh: security bump to version
 0.9.4
In-Reply-To: <9aa0bdcf9bae257961438cd369b273fade725f95.1586789244.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 13 Apr 2020 17:47:24 +0300")
References: <9aa0bdcf9bae257961438cd369b273fade725f95.1586789244.git.baruch@tkos.co.il>
Message-ID: <878si5hcxz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2020-1730: Possible DoS in client and server when handling
 > AES-CTR keys with OpenSSL.

 > Format hash file with two spaces delimiter.

 > Cc: Scott Fan <fancp2007@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
