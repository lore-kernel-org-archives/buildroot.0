From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Oct 2018 22:55:53 +0200
Subject: [Buildroot] [PATCH] system: update Config.in comment about
 systemd dependencies
In-Reply-To: <20180912141754.19062-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 12 Sep 2018 16:17:54 +0200")
References: <20180912141754.19062-1-thomas.petazzoni@bootlin.com>
Message-ID: <87murx1j52.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit 879fa7f82a86ffdc6d1cf7c9bfbb5cf830583d69, the
 > BR2_INIT_SYSTEMD option was changed to allow selecting with a uClibc
 > toolchain. Unfortunately, the corresponding Config.in comment, which
 > was already bogus, was not updated to take into account the numerous
 > dependencies of BR2_INIT_SYSTEMD.

 > Due to this, even if you have uClibc enabled, the BR2_INIT_SYSTEMD
 > option may not be visible, and the Config.in comment may also not be
 > visible, leaving the user in the dark.

 > This commit fixes the dependencies of the Config.in comment so that
 > they match the one of the BR2_INIT_SYSTEMD option.

 > Reported-by: Raphael Jacob <r.jacob2002@gmail.com>
 > Cc: Raphael Jacob <r.jacob2002@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
