From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Feb 2019 12:06:10 +0100
Subject: [Buildroot] [PATCH] package/docker-engine: drop unused _DAEMON
 option
In-Reply-To: <20190201220408.7421-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 1 Feb 2019 23:04:08 +0100")
References: <20190201220408.7421-1-peter@korsgaard.com>
Message-ID: <87h8dmzbz1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Since commit de336584d2 (package/docker-engine: split docker-{cli, engine},
 > bump to v18.09.0), the docker-engine package only builds the daemon part,
 > and the .mk file no longer use the _DAEMON option, so drop it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
