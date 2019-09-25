From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:45:20 +0200
Subject: [Buildroot] [PATCH] package/util-linux: create
 $(TARGET_DIR)/etc/pam.d if necessary
In-Reply-To: <20190914164143.4644-1-unixmania@gmail.com> (unixmania's message
 of "Sat, 14 Sep 2019 13:41:43 -0300")
References: <20190914164143.4644-1-unixmania@gmail.com>
Message-ID: <87blv8kvn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > Useful for test purposes when we want to install util-linux with a
 > custom TARGET_DIR, e.g.

 >     $ make util-linux-reinstall TARGET_DIR=/tmp/util-linux

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
