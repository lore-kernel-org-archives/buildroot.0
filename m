From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:39:22 +0100
Subject: [Buildroot] [PATCH 2/6] package/enlightenment: fix meson warning
In-Reply-To: <20180315225012.9845-2-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 15 Mar 2018 23:50:08 +0100")
References: <20180315225012.9845-1-romain.naour@gmail.com>
 <20180315225012.9845-2-romain.naour@gmail.com>
Message-ID: <87h8pfgkp1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > --disable-rpath was added by m4/lib-link.m4 with autotools based
 > buildsystem. Now we use meson, we don't have such option anymore.

 > The autotools eet-eet and eldbus_codegen options are named respectively
 > eet and eldbus-codegen with meson.

 > Fixes:
 > WARNING: Unknown command line options: "eet-eet, eldbus_codegen, rpath"

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed, thanks.

 > ---
 > This patch can be backported to 2018.02.x

Thanks. I'll do a backport run in a few days.

-- 
Bye, Peter Korsgaard
