From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Sep 2013 21:50:47 +0200
Subject: [Buildroot] [PATCH] opus-tools: disable flac when it is not
	selected
In-Reply-To: <1378836465-25626-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 10 Sep 2013 15:07:45 -0300")
References: <1378836465-25626-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <8761u8v4ko.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> opus-tools expects flac since the 0.1.7 bump unless otherwise told so.
 Gustavo> Disable it when it's not selected. Fixes:
 Gustavo> http://autobuild.buildroot.net/results/c8c/c8c1a682336c150ee401f76b173944611b96bd4e/

Committed, thanks.

-- 
Bye, Peter Korsgaard
