From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:10:47 +0100
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove non-existent
	enable/disable systemd options
In-Reply-To: <20161220000515.7996-1-james.knight@rockwellcollins.com> (James
 Knight's message of "Mon, 19 Dec 2016 19:05:14 -0500")
References: <20161220000515.7996-1-james.knight@rockwellcollins.com>
Message-ID: <87lgvb7yp4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.knight@rockwellcollins.com> writes:

 > The configuration flags `--enable-systemd` and `--disable-systemd` do
 > not exist in rsyslog (and may have never existed; most likely copy-paste
 > from other packages which have said options); removing the options.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
