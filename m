From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 23:48:01 +0200
Subject: [Buildroot] [PATCH] libgcrypt: security bump to version 1.7.7
In-Reply-To: <4623c3a5d42bad4ce5bac2cbe109a444f7189688.1496694364.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 5 Jun 2017 23:26:04 +0300")
References: <4623c3a5d42bad4ce5bac2cbe109a444f7189688.1496694364.git.baruch@tkos.co.il>
Message-ID: <87h8zsbxf2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fix possible timing attack on EdDSA session key.
 > https://lists.gnupg.org/pipermail/gnupg-announce/2017q2/000406.html

 > Add upstream provided SHA1 hash.

 > Switch to https download for better corporate firewall compatibility.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
