From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 02 Oct 2014 20:58:42 +0200
Subject: [Buildroot] [PATCH 2/2] opencv: Let opencv's build system
	handle the ts module dependencies
In-Reply-To: <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Wed, 1 Oct 2014 13:18:01 +0100")
References: <1412165881-64965-1-git-send-email-Vincent.Riera@imgtec.com>
 <1412165881-64965-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87zjdel2n1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > In the former version of opencv we added a patch to fix a dependencies
 > problem in the ts module. That issue was reported upstream and is now
 > merged in the 2.4.10 version:

 >   https://github.com/Itseez/opencv/commit/7018f9495920f974258502b9b8b26af16d7ee427

 > So now we can revert our former patch and let opencv's build system
 > handle the ts module dependencies as we already do in the other modules.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
