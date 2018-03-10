From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 19:59:12 +0100
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: fix template
 whitespace-syntax
In-Reply-To: <20180309131816.32466-1-aduskett@gmail.com> (Adam Duskett's
 message of "Fri, 9 Mar 2018 08:18:16 -0500")
References: <20180309131816.32466-1-aduskett@gmail.com>
Message-ID: <87r2orbvun.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > some files don't have a space inbetween the '<' and '::' charachters, which
 > will cause build failures on older toolchains. Adding a space inbetween these
 > two characters fixes the issue.

 > upstream-status: pending
 > https://github.com/Microsoft/cpprestsdk/pull/715

 > fixes:
 > http://autobuild.buildroot.net/results/797a9b5fdf6ab0f16f2249324b48292dfab61d9f
 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
