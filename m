From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 22:54:00 +0200
Subject: [Buildroot] [PATCH 1/1] sed: handle merged usr folder
In-Reply-To: <1445180905-15896-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Sun, 18 Oct 2015 11:08:25 -0400")
References: <1445180905-15896-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <876121jm6v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.d.knight@live.com> writes:

 > For targets prepared with a usr-move, package should not be attempting
 > to move binaries from `usr/bin` to `bin`.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>

A simpler fix is just to get sed to put the binary in /bin in the first
place,m so I've changed the package to configure with --bindir=/bin
instead and mark your patch as rejected.

-- 
Bye, Peter Korsgaard
