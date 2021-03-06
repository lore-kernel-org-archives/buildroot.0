From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 06 Mar 2021 17:07:14 +0100
Subject: [Buildroot] [PATCH 2/3] package/sudo: cleanup the CPE_ID
 variables
In-Reply-To: <63a31d34f0a02620644d881a4bd1d1382a96a0f8.1614983175.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 5 Mar 2021 23:27:43 +0100")
References: <cover.1614983175.git.yann.morin.1998@free.fr>
 <63a31d34f0a02620644d881a4bd1d1382a96a0f8.1614983175.git.yann.morin.1998@free.fr>
Message-ID: <874kho8dvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The CPE variables are derived from the package upstream values, so they
 > must be set from the package values, not the other way around.

 > Also drop CPE_ID_VALID as it is implied as soon as at least one CPE
 > variable is set.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
