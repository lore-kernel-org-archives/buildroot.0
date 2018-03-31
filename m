From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 09:00:13 +0200
Subject: [Buildroot] [PATCH 1/2] brotli: fix building of static libraries
In-Reply-To: <20180327200555.21748-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 27 Mar 2018 23:05:54 +0300")
References: <20180327200555.21748-1-aperez@igalia.com>
Message-ID: <874lkwwwzm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Include a patch to make CMake honor the BUILD_SHARED_LIBS which
 > Buildroot sets t choose the kind of libraries to build.

s/sets t/sets to/.

Committed, thanks.

-- 
Bye, Peter Korsgaard
