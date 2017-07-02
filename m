From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Jul 2017 17:53:38 +0200
Subject: [Buildroot] [PATCH v2 0/2] qt5multimedia: add missing
	dependencies
In-Reply-To: <1498549990-3548-1-git-send-email-brgl@bgdev.pl> (Bartosz
 Golaszewski's message of "Tue, 27 Jun 2017 09:53:07 +0200")
References: <1498549990-3548-1-git-send-email-brgl@bgdev.pl>
Message-ID: <87o9t2al8d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <brgl@bgdev.pl> writes:

 > Qt5Multimedia conditionally builds support for pulseaudio and alsa if
 > it detects corresponding libraries in the system but we need to
 > explicitly depend on these packages.

 > v1 -> v2:
 > - also added libglib2 as dependency for pulseaudio support
 > - new patch: add alsa to dependencies

 > Bartosz Golaszewski (2):
 >   qt5multimedia: conditionally add pulseaudio & libglib2 to dependencies
 >   qt5multimedia: conditionally add alsa-lib to dependencies

Committed both to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
