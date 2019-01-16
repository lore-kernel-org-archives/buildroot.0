From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Jan 2019 16:03:20 +0100
Subject: [Buildroot] [PATCH 1/1] minizip: bump to version 2.8.2
In-Reply-To: <20190115194839.15832-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 15 Jan 2019 20:48:39 +0100")
References: <20190115194839.15832-1-fontaine.fabrice@gmail.com>
Message-ID: <87fttsd4qv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - libbsd is now an optional dependency as HAVE_ARC4RANDOM_BUF is not
 >   always defined since version 2.7.1 and:
 >   https://github.com/nmoinvaz/minizip/commit/c73ef6e69b320349604c620bc429c461de8659af
 > - openssl is an optional dependency since version 2.7.0 and:
 >   https://github.com/nmoinvaz/minizip/commit/e5a5617a7c765858c1ed6fb0d40b6a750ff10131
 > - libiconv is an optional dependency since version 2.7.1 and:
 >   https://github.com/nmoinvaz/minizip/commit/6209991d6be5b070fb92d2aca6ed668c3db0829f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
