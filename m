From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 15 Jun 2015 08:33:35 +0200
Subject: [Buildroot] [PATCH] directfb: add an option for debugging
	support
In-Reply-To: <557DFB3B.6060701@mind.be>
References: <1434315067-19958-1-git-send-email-cedric.marie@openmailbox.org>
 <557DFB3B.6060701@mind.be>
Message-ID: <204a974adc4b86ce39264ea4c376f7c9@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-06-15 00:07, Arnout Vandecappelle a ?crit?:
>  There should be a --enable-debug-support somewhere around here,

You're right, that would be safer. In case they change the default 
value.
I will add it.

But I can't see any clear rule for that...
--enable-multi, --enable-fusion, --enable-debug, --enable-trace have no 
disable counterpart.
--enable-x11, --enable-unique, --enable-gif do have a --disable 
counterpart.

Moreover, there is a --disable-multi for host-directfb, while it is 
assumed to be the default for directfb (--enable-multi with no 
counterpart).


-- 
C?dric
