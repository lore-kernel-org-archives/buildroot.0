From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Feb 2011 22:47:28 +0100
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce HOST_DIR option
In-Reply-To: <1296651957-1633-1-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Wed, 2 Feb 2011 10:05:56 -0300")
References: <1296651957-1633-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wrlirtvz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Allow the user to define HOST_DIR in the config menu.
 Gustavo> This way when building an internal toolchain a separate (maybe shared)
 Gustavo> output directory may be defined and the toolchain can be used by
 Gustavo> multiple users and/or projects.

Committed, thanks.

-- 
Bye, Peter Korsgaard
