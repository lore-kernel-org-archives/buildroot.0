From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Sep 2015 14:29:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/usbmount: run-parts directory
	fix
In-Reply-To: <1437167312-27136-1-git-send-email-rdkehn@yahoo.com> (Doug Kehn's
 message of "Fri, 17 Jul 2015 16:08:32 -0500")
References: <1437167312-27136-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <87si6mfoe8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Doug" == Doug Kehn <rdkehn@yahoo.com> writes:

 > usbmount.mk created/installed run-parts scripts in
 > /etc/usbmount/usbmount.d.  However, usbmount executes run-parts on
 > /etc/usbmount/mount.d for UDEV add action and on /etc/usbmount/umount.d
 > for UDEV remove action. Change usbmount.mk to create the directories
 > referenced by usbmount and install the run-parts scripts appropriately.

 > Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
