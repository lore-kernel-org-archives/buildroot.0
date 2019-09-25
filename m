From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Sep 2019 21:48:46 +0200
Subject: [Buildroot] [PATCH] package/eudev: add missing user/groups
 "kvm" and "render"
In-Reply-To: <20190915123230.15954-1-unixmania@gmail.com> (unixmania's message
 of "Sun, 15 Sep 2019 09:32:30 -0300")
References: <20190915123230.15954-1-unixmania@gmail.com>
Message-ID: <8736gkkvhd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > They are required by the default udev rules.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12141

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
