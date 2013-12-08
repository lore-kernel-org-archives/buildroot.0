From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 22:25:34 +0100
Subject: [Buildroot] [PATCH 1/2] package: unification of name
	<pkg>_VERSION_MAJOR variable
In-Reply-To: <1385971203-11645-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Mon, 2 Dec 2013 09:00:02 +0100")
References: <1385971203-11645-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <87iouz9gs1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Currently there are two different names of the major version variable:
 > <PKG>_MAJOR_VERSION and <PKG>_VERSION_MAJOR
 > This patch unifies them to <PKG>_VERSION_MAJOR

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
