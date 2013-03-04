From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 04 Mar 2013 20:59:40 +0100
Subject: [Buildroot] [PATCH] stress: honor the BR2_PREFER_STATIC_LIB
	preference
In-Reply-To: <1362419240-7979-1-git-send-email-roylee17@gmail.com> (Tzu-Jung
 Lee's message of "Tue, 5 Mar 2013 01:47:20 +0800")
References: <1362206128-27771-1-git-send-email-roylee17@gmail.com>
 <1362419240-7979-1-git-send-email-roylee17@gmail.com>
Message-ID: <87a9qj9brn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "T" == Tzu-Jung Lee <roylee17@gmail.com> writes:

 T> From: roylee17 <roylee17@gmail.com>
 T> Stress is linked statically if the --enable-static is specified.
 T> However, this option is always specified in the global
 T> SHARED_STATIC_LIBS_OPTS to tell packages to build static libraries,
 T> if supported.

 T> If the BR2_PREFER_STATIC_LIB is not defined, we have to specify
 T> --disable-static explicitly to get stress linked dynamically.

 T> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
