From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:17:33 +0200
Subject: [Buildroot] [PATCH next] usbutils: lsusb.py is for python 3.x
 only
In-Reply-To: <5c1f4f9f8c6ed89fc685baf21cf6f5641087839c.1527610334.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 29 May 2018 19:12:14 +0300")
References: <5c1f4f9f8c6ed89fc685baf21cf6f5641087839c.1527610334.git.baruch@tkos.co.il>
Message-ID: <87h8mq5l0y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > usbutils version 010 converted the lsusb.py script to Python 3. Keep the
 > lsusb.py script on target only when Python 3.x is enabled.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
