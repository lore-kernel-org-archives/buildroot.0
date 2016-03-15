From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 20:57:19 +0100
Subject: [Buildroot] [PATCH] linknx: fix static build with mysql client
In-Reply-To: <672e8ac38f0595514d34b0fd06ef32e6c6e7697c.1458047028.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 15 Mar 2016 15:03:48 +0200")
References: <672e8ac38f0595514d34b0fd06ef32e6c6e7697c.1458047028.git.baruch@tkos.co.il>
Message-ID: <87r3fba50g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Add a patch correcting the libraries order in the link command to fix static
 > mysql libraries link.

 > Fixes:
 > http://autobuild.buildroot.net/results/2df/2dfcbd30079d13997de37e2d1c4643653e200be6/
 > http://autobuild.buildroot.net/results/4cc/4cc9c8bd223d1c9d604322ba04060dd35fc8aa45/
 > http://autobuild.buildroot.net/results/4bd/4bd04b7a3ca0092b50ad5c5212830d8935f54d48/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
