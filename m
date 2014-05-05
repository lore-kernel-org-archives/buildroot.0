From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 05 May 2014 08:59:04 +0200
Subject: [Buildroot] [PATCH 0 of 2 v3] Using gdb in buildroot
Message-ID: <patchbomb.1399273144@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi, 

This a small respin of two patches that Thomas Petazzoni sent to the list a
while back, adding a gdbinit file and updating the manual.

I think these could still go in for 2014.05.

In v2, the authorship of Thomas Petazzoni got lost, unintentionally. This
was the first time I'm resending someone else's patches, and foolishly
thought that the Signed-off-by line would be the key to authorship.
Note also that I'm not using git but Mercurial. When applying the mbox from
patchwork in my hg repo, the author is correctly shown as ThomasP, but as
I'm sending the patch in non-hg (plain) mode, that piece of information is
lost. It seems I have to add an explicit 'From: foo <bar>' line in the
commit message to get git to recognize the correct author.

Best regards, 
Thomas
