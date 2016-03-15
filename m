From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Mar 2016 23:15:47 +0100
Subject: [Buildroot] [PATCH v2 2/2] Revert "gcc/gcc-final: pass
	TARGET_ABI flags to configure with --enable-cxx-flags"
In-Reply-To: <1457840717-10596-3-git-send-email-jcmvbkbc@gmail.com> (Max
 Filippov's message of "Sun, 13 Mar 2016 06:45:17 +0300")
References: <1457840717-10596-1-git-send-email-jcmvbkbc@gmail.com>
 <1457840717-10596-3-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <87d1qv75gs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Max" == Max Filippov <jcmvbkbc@gmail.com> writes:

 > This reverts commit 2dcab526a97d1dbcb73c3cd578e5bf2853853a10.
 > Now that gcc correctly propagates CXXFLAGS_FOR_TARGET for libstdc++
 > build this is no longer needed.

 > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
