From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:14:28 +0100
Subject: [Buildroot] [PATCH] sunxi-mali-mainline-driver: bump version
In-Reply-To: <1520957288-107199-1-git-send-email-giulio.benetti@micronovasrl.com>
 (Giulio Benetti's message of "Tue, 13 Mar 2018 17:08:08 +0100")
References: <1520957288-107199-1-git-send-email-giulio.benetti@micronovasrl.com>
Message-ID: <87vadzk79n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > For stop using cma.
 > git shortlog --invert-grep --grep travis --no-merges 94ccbc8924c12a818d61d36a4b389b74a89fde3c..
 > Maxime Ripard (1):
 >       mali: Stop using the reserved-memory region to setup the fb area

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
