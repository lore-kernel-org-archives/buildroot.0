From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed, 19 Sep 2012 12:11:40 +0200
Subject: [Buildroot] wpa_supplicant changes
In-Reply-To: <5058EFD8.4010809@mind.be>
References: <5058EFD8.4010809@mind.be>
Message-ID: <1348049503-1469-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here's a new patch series based on comments from Arnout. The first
patch is the old one with whitespace issues fixed. The second
patch removes some redundant escaping from the various sed commands
in wpa_supplicant.mk. The third patch tries to make the whole thing
more readable by introducing macros for editing the .config file.
Please review and comment.


Regards, Sven
