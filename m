From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 19 Feb 2013 16:19:16 +0100
Subject: [Buildroot] [PATCH v2] vim: Add post-install hook to remove
	documentation from target
In-Reply-To: <871uccil82.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 19 Feb 2013 12:42:05 +0100")
References: <1360666299-3661-1-git-send-email-markos.chandras@gmail.com>
 <871uccil82.fsf@dell.be.48ers.dk>
Message-ID: <87wqu4fi17.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

>>>>> "Markos" == Markos Chandras <markos.chandras@gmail.com> writes:
 Markos> From: Markos Chandras <markos.chandras@imgtec.com>
 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

 Peter> Committed, thanks.

Hmm, I take that back:

http://autobuild.buildroot.net/results/adc3e2f876f83a4011574e03bceb0007d7e891a2/build-end.log

Seems like it perhaps only should be done if BR2_PACKAGE_VIM_RUNTIME is
enabled?

Care to fix that?

-- 
Bye, Peter Korsgaard
