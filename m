From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Mar 2018 08:59:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/efl: add missing licenses
In-Reply-To: <20180303073507.20146-1-ciro.santilli@gmail.com> (Ciro Santilli's
 message of "Sat, 3 Mar 2018 07:35:06 +0000")
References: <20180303073507.20146-1-ciro.santilli@gmail.com>
Message-ID: <874llxd1yq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ciro" == Ciro Santilli <ciro.santilli@gmail.com> writes:

 > From: Romain Naour <romain.naour@gmail.com>
 > ecore_con added with efl 1.17 is under MIT license (COPYING.NGINX-MIT)
 > ector added with efl 1.15 is under FTL license (COPYING.FTL)

 > While at it, add license file hash.

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Ehh, why did you send this patch and resend the kernel headers patch?
This is already in master and the kernel headers patch looks identical
to your first one.

I've marked these as superseeded in patchwork.

-- 
Bye, Peter Korsgaard
