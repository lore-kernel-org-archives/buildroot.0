From: Stefan Froberg <stefan.froberg@petroprogram.com>
Date: Wed, 15 Aug 2012 22:00:25 +0300
Subject: [Buildroot] [PATCH] python: firefox host-python dependency needs
	--enable-unicodedata
Message-ID: <1345057226-18726-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all

Firefox needs host-python to be built with --enable-unicodedata.
This patch enables/disables that switch depending of your
target python configuration (BR2_PACKAGE_PYTHON_UNICODEDATA).

As far as I can tell, this was the last dependency that needed some handling
before building firefox.

If this and those two previously sended patches

http://lists.busybox.net/pipermail/buildroot/2012-August/057378.html

and

http://lists.busybox.net/pipermail/buildroot/2012-August/057380.html

are okay with you Thomas, then Im ready to send firefox patch next.

Best regards

Stefan
