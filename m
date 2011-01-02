From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Jan 2011 23:01:42 +0100
Subject: [Buildroot] [PATCH 4/6] oprofile: use new libbfd option
In-Reply-To: <1293795546-19674-7-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 31 Dec 2010 08:39:04 -0300")
References: <1293795546-19674-1-git-send-email-gustavo@zacarias.com.ar>
	<1293795546-19674-7-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tyhrc6d5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Convert the oprofile target to select the new libbfd staging/target
 Gustavo> option to avoid a huge target binutils for a simple task.

Committed, thanks.

-- 
Bye, Peter Korsgaard
