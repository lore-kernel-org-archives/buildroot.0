From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 13 Sep 2011 13:31:49 +0200
Subject: [Buildroot] CodeSourcery moved to Mentor Graphics
In-Reply-To: <201109131251.21570.yann.morin.1998@anciens.enib.fr> (Yann
 E. MORIN's message of "Tue, 13 Sep 2011 12:51:21 +0200")
References: <4E6F323A.1080605@xor-gate.org>
 <201109131251.21570.yann.morin.1998@anciens.enib.fr>
Message-ID: <87fwk04r16.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> Jerry, All,
 Yann> On Tuesday 13 September 2011 12:36:42 Jerry Jacobs wrote:
 >> I tried to create a new configuration for the Ledato NanosG20 
 >> (AT91SAM9G20) with the codesourcery toolchain. But it was not able to 
 >> download the toolchain (Using latest buildroot from GIT).

 Yann> The issue has been reported to Mentor Graphics by Peter, and it seems they
 Yann> have fixed the issue, as reported by Peter:
 Yann>   http://lists.busybox.net/pipermail/buildroot/2011-September/045580.html

 Yann> I'll check here, but if it still breaks for you, just say so.

Indeed, it should be fixed now (also for older Buildroot releases), so
please try again:

--2011-09-13 13:30:29--  http://www.codesourcery.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
Resolving www.codesourcery.com (www.codesourcery.com)... 174.129.20.178
Connecting to www.codesourcery.com (www.codesourcery.com)|174.129.20.178|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: https://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 [following]
--2011-09-13 13:30:29--  https://sourcery.mentor.com/sgpp/lite/arm/portal/package6488/public/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
Resolving sourcery.mentor.com (sourcery.mentor.com)... 107.20.212.105
Connecting to sourcery.mentor.com (sourcery.mentor.com)|107.20.212.105|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 [following]
--2011-09-13 13:30:35--  https://sourcery.mentor.com/public/gnu_toolchain/arm-none-linux-gnueabi//arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
Connecting to sourcery.mentor.com (sourcery.mentor.com)|107.20.212.105|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 82460512 (79M) [application/x-bzip2]
Saving to: `/var/lib/downloads/arm-2010q1-202-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2'

-- 
Bye, Peter Korsgaard
