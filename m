From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 00:20:34 +0200
Subject: [Buildroot] [PATCH] python-netifaces: use single version
	externally managed
In-Reply-To: <1367846012-26041-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 6 May 2013 10:13:32 -0300")
References: <1367846012-26041-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878v3r4uod.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> We want --single-version-externally-managed (and --root=/) to make
 Gustavo> python packages uncompressed (python eggs are zip files) since
 Gustavo> compression should be a target filesystem responsibility.
 Gustavo> And we don't need/want multiple versions of the same package in the
 Gustavo> target since packages should be handled by buildroot on any sane
 Gustavo> embedded system.

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
