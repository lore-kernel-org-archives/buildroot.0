From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 09:05:15 +0200
Subject: [Buildroot] [PATCH 2/2] woff2: fix static builds
In-Reply-To: <20180327200555.21748-2-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 27 Mar 2018 23:05:55 +0300")
References: <20180327200555.21748-1-aperez@igalia.com>
 <20180327200555.21748-2-aperez@igalia.com>
Message-ID: <87zi2ovi6s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Include a patch to make CMake correctly find the Brotli libraries when
 > they have been built as static libraries.

 > Fixes:
 > - http://autobuild.buildroot.net/results/f1c4b5aeb12af7b7a3e8ae01c219004ecd9befd6/
 > - http://autobuild.buildroot.net/results/74d20ff38766466623cc4a9eb18afcda831bc20b/

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

I see in the pull request that you wanted to rework the patch for
non-pkg-config cases, but I think this is good enough for us for now.

Committed, thanks.

Please send an update when you rework the patch.

-- 
Bye, Peter Korsgaard
