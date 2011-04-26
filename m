From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Apr 2011 22:42:52 +0200
Subject: [Buildroot] [PATCH 1/8] toolchain: reorganize target gcc options
In-Reply-To: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 13 Apr 2011 13:29:22 -0300")
References: <1302712169-28385-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y62w2183.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> * Move target gcc language selections to the package menu.
 Gustavo> * Disable objc & fortran options unless target gcc is selected.
 Gustavo> * Rename the "native toolchain" option to gcc.
 Gustavo> * Disable target gcc unless we're using a buildroot toolchain.

Committed, thanks.

-- 
Bye, Peter Korsgaard
