From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Nov 2013 20:41:50 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: define BINDIR for
	systemd/dbus service files
In-Reply-To: <1385660340-2885-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 28 Nov 2013 14:39:00 -0300")
References: <1385660340-2885-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874n6wz535.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > BINDIR is used to point systemd/dbus service files to the correct binary
 > path where wpa_supplicant resides.
 > So define it to avoid the default /usr/local path that doesn't work.
 > Solves bug #6704

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
