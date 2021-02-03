From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Feb 2021 18:43:41 +0100
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: don't install
 init script if nodm is enabled
In-Reply-To: <20210130101834.18086-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 30 Jan 2021 11:18:33 +0100")
References: <20210130101834.18086-1-peter@korsgaard.com>
Message-ID: <87k0rpgi7m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Both S40xorg and S90nodm tries to run an Xserver on vt1, causing the nodm
 > one to fail.  If nodm is enabled, then that is likely what the user wants to
 > run, so skip installing S40xorg.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
