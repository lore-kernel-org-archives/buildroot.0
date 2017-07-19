From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 19:45:59 +0200
Subject: [Buildroot] [PATCH 1/1] pulseaudio: add bluez5_utils as
	dependency
In-Reply-To: <20170714162137.9402-1-ccrisan@gmail.com> (Calin Crisan's message
 of "Fri, 14 Jul 2017 19:21:35 +0300")
References: <20170714162137.9402-1-ccrisan@gmail.com>
Message-ID: <87d18w7220.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Calin" == Calin Crisan <ccrisan@gmail.com> writes:

 > The pulseaudio configure script autodetects the presence of
 > bluez 4.x and 5.x packages on the system and will exclude the
 > bluetooth-related modules in their absence.

 > This commit ensures that bluez5_utils, if selected, are installed
 > before pulseaudio. The same already happens for bluez_utils (4.x).

 > Signed-off-by: Calin Crisan <ccrisan@gmail dot com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
