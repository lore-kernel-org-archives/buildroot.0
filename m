From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 27 Jan 2014 09:23:23 +0100
Subject: [Buildroot] [PATCH] gcc 4.8.2: arm fixes for stack corruption
In-Reply-To: <20140124151119.GA27232@gmail.com> (Andrew Ruder's message of
 "Fri, 24 Jan 2014 09:11:19 -0600")
References: <20140124151119.GA27232@gmail.com>
Message-ID: <87eh3tzvd0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrew" == Andrew Ruder <andrew.ruder@elecsyscorp.com> writes:

 > This seems to especially affect the kernel, but in an
 > interrupt-heavy system, this fixes a bug that can cause frequent
 > NULL pointer dereference crashes on ARM systems.

Committed, thanks.

-- 
Bye, Peter Korsgaard
