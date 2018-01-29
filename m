From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Jan 2018 21:06:08 +0100
Subject: [Buildroot] [PATCH v2 1/1] libcpprestsdk: require nptl threads.
In-Reply-To: <20180123103924.23294-1-aduskett@gmail.com> (Adam Duskett's
 message of "Tue, 23 Jan 2018 05:39:24 -0500")
References: <20180123103924.23294-1-aduskett@gmail.com>
Message-ID: <87o9lc5t1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > pthread_condattr_setclock is uses which is NPTL only.
 > Fixes http://autobuild.buildroot.net/results/abf058948c9e4e9a50d42a05689b76bfb54a02e2/build-end.log

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - Removed BR2_TOOLCHAIN_HAS_THREADS (Baruch)
 >   - Removed NPTL threads from comment in favor of just NPTL (Baruch)
 >   - Removed redundant threads from comment (Baruch)

Committed, thanks.

-- 
Bye, Peter Korsgaard
