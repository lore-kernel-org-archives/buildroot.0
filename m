From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Feb 2018 22:44:20 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: Make systemd link correctly
In-Reply-To: <20180227212131.3142-1-tpiepho@impinj.com> (Trent Piepho's
 message of "Tue, 27 Feb 2018 13:21:31 -0800")
References: <20180227212131.3142-1-tpiepho@impinj.com>
Message-ID: <874lm2m7kb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Trent" == Trent Piepho <tpiepho@impinj.com> writes:

 > The link in /etc/systemd/system/, named dbus-org.bluez.service, pointing to
 > ../../../../usr/lib/systemd/system/bluetooth.service has one too many ".." in
 > it.  Likely the target was copied from the other link in
 > /etc/systemd/system/bluetooth.target.wants/, which is one level deeper.

 > Adjust link to be correct.

 > Signed-off-by: Trent Piepho <tpiepho@impinj.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
