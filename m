From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 21:21:09 +0200
Subject: [Buildroot] [PATCH] support/mkusers: Preserve group members
In-Reply-To: <20180903131116.5404-1-johan.oudinet@gmail.com> (Johan Oudinet's
 message of "Mon, 3 Sep 2018 15:11:16 +0200")
References: <20180903131116.5404-1-johan.oudinet@gmail.com>
Message-ID: <87ftxp323e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johan" == Johan Oudinet <johan.oudinet@gmail.com> writes:

 > When the function add_one_group is called on an existing group,
 > make sure the members of this group are not removed in the process of
 > deleting then re-adding the group.

 > Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
