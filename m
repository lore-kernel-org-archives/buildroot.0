From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 23:05:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] busybox: Make S01logging source a
	default file.
In-Reply-To: <1457344097-20448-1-git-send-email-nicolas.cavallari@green-communications.fr>
 (Nicolas Cavallari's message of "Mon, 7 Mar 2016 10:48:17 +0100")
References: <56D61C10.9080409@lucaceresoli.net>
 <1457344097-20448-1-git-send-email-nicolas.cavallari@green-communications.fr>
Message-ID: <87io0vxq6p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Cavallari <nicolas.cavallari@green-communications.fr> writes:

 > The default syslog parameters are to keep only 200-400 KiB of logs,
 > which is very few if there is a spammy daemon on the system, or a daemon
 > that fails and then spams errors that hides the original problem.

 > Make S01logging source a /etc/default/logging file where these
 > parameters can be overridden.

 > Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
