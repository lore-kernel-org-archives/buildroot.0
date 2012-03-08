From: ludovic.desroches at atmel.com <ludovic.desroches@atmel.com>
Date: Thu,  8 Mar 2012 13:00:54 +0100
Subject: [Buildroot] [RFC] using series file
In-Reply-To: <201202282119.38907.arnout@mind.be>
References: <201202282119.38907.arnout@mind.be>
Message-ID: <1331208055-18533-1-git-send-email-ludovic.desroches@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a patch built on the top of the serie I've sent previously.

Do you think it is sufficient. I was looking for a package using debian
patches to test it. I notice that CVS was using this kind of patch but
there is no series file into the 'patches' directory so the behavior is still
the same (patch order is ls sorting order).

Regards

Ludovic
