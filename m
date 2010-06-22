From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 22 Jun 2010 21:10:57 +0000 (UTC)
Subject: [Buildroot] Suggestion for config menu help for path values
Message-ID: <hvr8t1$io0$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just a suggestion for anytime somebody is working on the config menu
help for an option that allows a path to be entered: always specify in
the item's help whether an absolute path is required, and if not,
where the starting point is for a relative path.

For several different options, it's taken me many guesses to figure
out from what working direction a relative path should be referenced.
When each guess requires a build from-scratch, you can spend hours
trying to figure out what path value to enter for a particular script
or config file.

Right now I'm trying to figure out the CWD when the post-build script
is called, and I'll submit a help patch when I figure out the answer.

Another source of confusion I've run into a few times are cases where
the title for a config item doesn't match up with either the config
variable name or the phrase commonly used elsewhere to refer to that
item.  For example, it takes a bit if digging to figure out that in
the config menus, what the documentation calls the "post-build
script", who's value is "BR2_ROOTFS_POST_BUILD_SCRIPT" is titled
"Custom script to run before packing files".

A title including the words "post build script" would seem to be a
more obvious/consistent choice.

-- 
Grant Edwards               grant.b.edwards        Yow! !  I'm in a very
                                  at               clever and adorable INSANE
                              gmail.com            ASYLUM!!
