From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 May 2011 23:03:10 +0200
Subject: [Buildroot] [PATCH] libnl: minor package fixes
In-Reply-To: <1305555506-10082-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Mon, 16 May 2011 11:18:26 -0300")
References: <1305555506-10082-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sjsegxyp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * libnl fails to build with multiple jobs so keep make at -j1
 Gustavo> * Multiple libraries are installed so update uninstall target for this

Committed with a minor fixup to also remove the usr/lib/libnl subdir -
Thanks.


-- 
Bye, Peter Korsgaard
