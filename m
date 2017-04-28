From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:50:21 +0200
Subject: [Buildroot] [PATCH] libnl: add upstream security fix
In-Reply-To: <b4aa22c38bf917ebab1e80069dacbe2c892e9bc1.1493290258.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Thu, 27 Apr 2017 13:50:58 +0300")
References: <b4aa22c38bf917ebab1e80069dacbe2c892e9bc1.1493290258.git.baruch@tkos.co.il>
Message-ID: <87h918hf1u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > CVE-2017-0553: An elevation of privilege vulnerability in libnl could enable a
 > local malicious application to execute arbitrary code within the context of
 > the Wi-Fi service

 > https://www.mail-archive.com/debian-bugs-dist at lists.debian.org/msg1511855.html

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
