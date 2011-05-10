From: Allan W. Nielsen <a@awn.dk>
Date: Tue, 10 May 2011 11:32:52 +0200
Subject: [Buildroot] Make DL_DIR absolute
Message-ID: <1305019973-16043-1-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Thomas Petazzoni here is a patch which converts DL_DIR
to a relative path. The reason for this is that GIT_DOWNLOAD assumes
an absolute path
