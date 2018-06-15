From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jun 2018 13:17:28 +0200
Subject: [Buildroot] [PATCH 1/1] autossh: put back AUTORECONF
In-Reply-To: <20180614190034.10022-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 14 Jun 2018 21:00:34 +0200")
References: <20180614190034.10022-1-fontaine.fabrice@gmail.com>
Message-ID: <874li447uf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > cabf1d658ebc878088e8ee592549d412f8f82f6f wrongly removed AUTORECONF=YES
 > indeed configure is still not up to date.
 > Without it, --with-ssh option is not taken into account and so build
 > fails if ssh is not installed in PATH.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/25d681f9df22c07cdf5a6b8756bfc2d5ecf36247

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, but I applied Baruch's patch, so I've marked this as superseeded
in patchwork.

-- 
Bye, Peter Korsgaard
