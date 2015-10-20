From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Oct 2015 23:00:58 +0200
Subject: [Buildroot] [PATCH 1/1] coreutils: handle merged usr folder
In-Reply-To: <1445149965-15702-1-git-send-email-james.knight@rockwellcollins.com>
 (James Knight's message of "Sun, 18 Oct 2015 02:32:45 -0400")
References: <1445149965-15702-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <87y4exi7at.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "James" == James Knight <james.d.knight@live.com> writes:

 > For targets prepared with a usr-move, coreutils should not be attempting
 > to move binaries from `usr/bin` to `bin`.

 > Signed-off-by: James Knight <james.knight@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
