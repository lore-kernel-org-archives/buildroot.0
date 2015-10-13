From: Mike Williams <mike@mikebwilliams.com>
Date: Tue, 13 Oct 2015 10:45:37 -0400
Subject: [Buildroot] fix for connmand start failure
Message-ID: <1444747538-2996-1-git-send-email-mike@mikebwilliams.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure if this is the best place way to fix the issue, but connmand no
longer starts properly on current master due to a permissions error taking its
name on the dbus system bus. Installing connman's connman-dbus.conf to
/etc/dbus-1/system.d fixes the issue.
