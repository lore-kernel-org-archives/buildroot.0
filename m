From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jul 2012 19:15:30 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: add default login port to
 /etc/securetty
In-Reply-To: <5001A4D3.1030802@mind.be>
References: <1342149545-10417-1-git-send-email-roylee17@gmail.com>
 <5001A4D3.1030802@mind.be>
Message-ID: <20120714191530.539ca71c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 14 Jul 2012 18:56:51 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   But perhaps it's even better to remove securetty completely?  If it just
> enumerates all possible ttys (even non-existent ones), it doesn't really add
> security...  (Note: I haven't verified if util-linux's login allows root login if
> /etc/securetty is missing.)

Or we just add the tty that is selected to have the getty on (i.e the
skeleton would no longer have a etc/securetty file, and it would only
be created with one entry, as done by the patch being discussed).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
