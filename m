From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Apr 2010 09:30:32 +0200
Subject: [Buildroot] [PATCH v2] toolchain/binutils: Improve arm linking
	performance
In-Reply-To: <1271713291-27457-1-git-send-email-lwalkera@ieee.org> (Laine
	Walker-Avina's message of "Mon, 19 Apr 2010 14:41:31 -0700")
References: <78w8jcma5.fsf@macbook.be.48ers.dk>
	<1271713291-27457-1-git-send-email-lwalkera@ieee.org>
Message-ID: <87mxwybmxz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Laine" == Laine Walker-Avina <lwalkera@ieee.org> writes:

 Laine> Backported a patch from CVS that improves linking times for large
 Laine> projects (eg 700s to 6s). See
 Laine> http://old.nabble.com/-PATCH--Reduce-ARM-linking-time-tt27961038.html
 Laine> for the original.

Committed, thanks.

-- 
Bye, Peter Korsgaard
