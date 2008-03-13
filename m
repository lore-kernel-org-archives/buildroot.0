From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 13 Mar 2008 20:35:56 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain
In-Reply-To: <46a136670803131128v593e8652geac1b0ca62aaa3d4@mail.gmail.com>
	(John Voltz's message of "Thu\, 13 Mar 2008 14\:28\:38 -0400")
References: <20080313171042.D38B5120156@busybox.net>
	<87prty5vpd.fsf@macbook.be.48ers.dk>
	<46a136670803131128v593e8652geac1b0ca62aaa3d4@mail.gmail.com>
Message-ID: <87myp24dsz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Voltz <john.voltz@gmail.com> writes:

 John>     What's the purpose of cat?



 John> It prevents the echo from overwriting the last echo, if there
 John> are multiple patches.

Huh? Why wouldn't echo ${i} >> ${target_dir}/.patch... work?

-- 
Bye, Peter Korsgaard
