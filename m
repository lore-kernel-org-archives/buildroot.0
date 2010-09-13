From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Mon, 13 Sep 2010 20:07:15 +0200
Subject: [Buildroot] resend transmission bittorrent client after 1st review
	by Thomas
Message-ID: <1284401236-731-1-git-send-email-marcus.osdoba@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mailinglist,

Please find attached the overworked patch of Kelvin Cheung and Marek Belisko
which introduces transmission bittorrent client. As already mentioned, it seems ideal
for headless embedded usage.

The package uses autotargets inrastructure (hopefully in the way it intended to be).
An init-rd skript is installed when choosing option REMOTECONTROL. 
The link in the var directory for localstatedir is also created by the package.

Thanks for reviewing the first patch and let me know what do you think about this version.

Regards,
Marcus
