From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:10:51 +0100
Subject: [Buildroot] [PATCH 2/2] rsyslog: enable journal plugins when
	using systemd
In-Reply-To: <20161220000515.7996-2-james.knight@rockwellcollins.com> (James
 Knight's message of "Mon, 19 Dec 2016 19:05:15 -0500")
References: <20161220000515.7996-1-james.knight@rockwellcollins.com>
 <20161220000515.7996-2-james.knight@rockwellcollins.com>
Message-ID: <87h95z7yp0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > The rsyslog package provides input and output plugins for journald which
 > are disabled by default. The following adds the option to include
 > `imjournal` and `omjournal` modules when building for a systemd target.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
