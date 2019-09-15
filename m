From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Sep 2019 09:15:46 +0200
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 aarch64_be
In-Reply-To: <20190911131711.87498-1-giulio.benetti@micronovasrl.com> (Giulio
 Benetti's message of "Wed, 11 Sep 2019 15:17:11 +0200")
References: <20190911131711.87498-1-giulio.benetti@micronovasrl.com>
Message-ID: <87blvm58t9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:

 > In libnss there is a bug leading to build failure due to double declared
 > functions. This is due to 2 different #ifdef statements treating the
 > same function-set.

 > Add patch to fix this by making the 2 #ifdef statements equal.

 > Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
 > ---
 > Already sent upstream:
 > https://bugzilla.mozilla.org/show_bug.cgi?id=1580126

Committed after adding the autobuilder reference and the upstream
bugtracker to the patch, thanks.

-- 
Bye, Peter Korsgaard
