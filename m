From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Feb 2011 23:00:46 +0100
Subject: [Buildroot] [PATCH 9/9] cdrkit: drop host-cmake dependencies
In-Reply-To: <1296138094-502-9-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Thu, 27 Jan 2011 11:21:34 -0300")
References: <1296138094-502-1-git-send-email-gustavo@zacarias.com.ar>
	<1296138094-502-9-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87hbcmrt9t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Now that it's been converted to cmaketargets it doesn't need
 Gustavo> the host-cmake dependencies since this are fulfilled in the
 Gustavo> infrastructure.

Committed, thanks.

-- 
Bye, Peter Korsgaard
