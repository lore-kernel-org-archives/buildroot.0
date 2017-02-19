From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Feb 2017 23:20:52 +0100
Subject: [Buildroot] [PATCH] erlang: set ERL_TOP to avoid using user's
	version
In-Reply-To: <1487451671-2066-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Sat, 18 Feb 2017 16:01:11 -0500")
References: <1487451671-2066-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <878tp1rfej.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Explicitly set the ERL_TOP environment variable to override values set
 > on a user's system. This prevents Erlang's configure scripts from
 > using source files outside of the ones that Buildroot downloaded.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
