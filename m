From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Mar 2021 22:22:49 +0100
Subject: [Buildroot] [PATCH] package/python-aioblescan: Bump to version
 0.2.7
In-Reply-To: <20210225134802.257199-1-grzegorz@blach.pl> (Grzegorz Blach's
 message of "Thu, 25 Feb 2021 14:48:00 +0100")
References: <20210225134802.257199-1-grzegorz@blach.pl>
Message-ID: <87blc2o9g6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Grzegorz" == Grzegorz Blach <grzegorz@blach.pl> writes:

 > Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

What is the upstream status of the patch? You don't mention it in your
commit message.

Also use the -N option to git format-patch as pointed out by
check-package:

package/python-aioblescan/0001-Load-long-description-from-README.rst-instead-of-REA.patch:4: generate your patches with 'git format-patch -N'

-- 
Bye, Peter Korsgaard
