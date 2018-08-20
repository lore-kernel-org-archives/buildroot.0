From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Aug 2018 22:32:18 +0200
Subject: [Buildroot] [PATCH v2 1/3] libglib2: backport upstream patch to
 handle missing fcntl() flags
In-Reply-To: <20180730220218.26454-1-hollis_blanchard@mentor.com> (Hollis
 Blanchard's message of "Mon, 30 Jul 2018 15:02:16 -0700")
References: <20180730220218.26454-1-hollis_blanchard@mentor.com>
Message-ID: <87k1ok3hkd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hollis" == Hollis Blanchard <hollis_blanchard@mentor.com> writes:

 > On RHEL6 hosts, fcntl.h doesn't define F_SETPIPE_SZ or F_GETPIPE_SZ. Upstream
 > glib has a patch for this case that wasn't applied to their 2.56.1 branch.

 > Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

Committed to 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
