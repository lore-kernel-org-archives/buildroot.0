From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Sep 2015 22:06:39 +0200
Subject: [Buildroot] [PATCH] package/eudev: fix install command
In-Reply-To: <1441107556-8212-1-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Tue, 1 Sep 2015 13:39:16 +0200")
References: <1441107556-8212-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <87k2s9q4z4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > The directory $(TARGET_DIR)/etc/init.d/ must exist before installing
 > S10udev init script.
 > Add the missing "-D" option to create the "init.d" directory.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
