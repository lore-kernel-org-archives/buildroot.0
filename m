From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Nov 2015 23:05:05 +0100
Subject: [Buildroot] [PATCH] opencv: use the same logic as opencv3 for
	gstreamer support
In-Reply-To: <1448283272-56998-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Mon, 23 Nov 2015 12:54:32 +0000")
References: <1448283272-56998-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87a8pxpypa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > The logic for enabling gstreamer support in opencv is not correct. We
 > select gstreamer-0.10 packages but then we enable gstreamer1 support in
 > the opencv.mk file. opencv3 has the correct logic, so let's use it in
 > opencv as well.

 > Fixes:

 >   http://autobuild.buildroot.net/results/f6d/f6d0a4ffe347cbb868998856aca674ba8bc2e281/

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
