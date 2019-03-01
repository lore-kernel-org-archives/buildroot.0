From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Mar 2019 10:07:33 +0100
Subject: [Buildroot] No OpenSSL 1.1.x support in Qt 5.6.x.
In-Reply-To: <BL2P132MB00203E45B23E62E378ED9B02E5760@BL2P132MB0020.NAMP132.PROD.OUTLOOK.COM>
 (James Grant's message of "Fri, 1 Mar 2019 02:21:29 +0000")
References: <BL2P132MB00203E45B23E62E378ED9B02E5760@BL2P132MB0020.NAMP132.PROD.OUTLOOK.COM>
Message-ID: <87imx3ufmy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Grant <james.grant@jci.com> writes:

 > Hi,
 > There is no OpenSSL 1.1.x support in Qt 5.6.x and no-one appears to have back-ported support.

 > https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9

 > I'm suggesting that for upcoming 2019.02 release that no attempt is made to build with SSL support for 5.6.

 > About to send patch to that effect.

Yes. I was hoping that users of Qt 5.6 would step up and send patches,
but given that hasn't happened and 2019.02 is overdue, that is probably
the least bad solution.

Looking forward to your patch.

-- 
Bye, Peter Korsgaard
