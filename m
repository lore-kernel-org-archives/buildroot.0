From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Oct 2011 07:34:43 +0200
Subject: [Buildroot] Derive HOST_FOO_DEPENDENCIES automatically
In-Reply-To: <201110032335.06739.arnout@mind.be>
References: <201110032133.44496.arnout@mind.be>
 <1317676858-3407-1-git-send-email-arnout@mind.be>
 <201110032335.06739.arnout@mind.be>
Message-ID: <20111004073443.24b1da67@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 3 Oct 2011 23:35:05 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  By the way, there is a disappointingly large number of packages that
> have a difference between FOO_DEPENDENCIES and HOST_FOO_DEPENDENCIES:

Not necessarily a problem. For example, for:

> package/libgtk2/libgtk2.mk

It is expected, because we don't need a full blown host libgtk2 version
to build the target libgtk2.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
