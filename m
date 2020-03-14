From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 15:16:25 +0100
Subject: [Buildroot] [PATCH] package/jpeg-turbo: force fPIC for shared
 libraries
In-Reply-To: <20200222181040.375497-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sat, 22 Feb 2020 19:10:40 +0100")
References: <20200222181040.375497-1-romain.naour@gmail.com>
Message-ID: <87ftebxbra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > When BR2_SSP_ALL is set, there is a link issue due to missing -fPIC in CFLAGS.
 > Set CMAKE_POSITION_INDEPENDENT_CODE=ON to add it.

 > This is a similar fix as for gtest package [1]

 > [1] https://git.buildroot.net/buildroot/commit/?id=2026621f3c60167aa8ba48e658be1b214d1347d7

 > Fixes:
 > http://autobuild.buildroot.net/results/e1f/e1f164cee16b037c0232fdda40fc16caf8f0c0af

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Murat Demirten <mdemirten@yh.com.tr>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
