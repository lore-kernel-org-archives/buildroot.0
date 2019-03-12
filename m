From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Mar 2019 16:20:58 +0100
Subject: [Buildroot] [PATCH v2] ntp: security bump to version 4.2.8p13
In-Reply-To: <7ad4d84e13d178902878c73f5995ff242aa8028e.1552391787.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 12 Mar 2019 13:56:27 +0200")
References: <7ad4d84e13d178902878c73f5995ff242aa8028e.1552391787.git.baruch@tkos.co.il>
Message-ID: <87ef7cf7ad.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2019-8936: Crafted null dereference attack in authenticated
 > mode 6 packet.

 > Drop upstream patches.

 > Update COPYRIGHT file hash; text formatting (line width) changes.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > ---
 > v2: Update license file hash

Committed, thanks.

-- 
Bye, Peter Korsgaard
