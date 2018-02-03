From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Feb 2018 19:56:16 +0100
Subject: [Buildroot] [PATCH] package/bash: remove dead comment
In-Reply-To: <20180203150924.3251-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Sat, 3 Feb 2018 16:09:24 +0100")
References: <20180203150924.3251-1-yann.morin.1998@free.fr>
Message-ID: <87372h52cv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 02e5cef1 (system: add option to choose what /bin/sh points to)
 > removed the symlink creation, but forgot to remove the corresponding
 > comment, which is now more puzzling than amusing...

 > Remove the comment.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

 > ---
 > Noticed while reviewing the series adding shells to /etc/shells.
 > Thanks Romain! ;-)

Committed, thanks.

-- 
Bye, Peter Korsgaard
