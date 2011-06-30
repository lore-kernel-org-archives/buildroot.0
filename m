From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jun 2011 20:03:23 +0200
Subject: [Buildroot] tail -f /var/log/messages in inittab
In-Reply-To: <4E0CA8F9.7080706@lucaceresoli.net>
References: <4E0CA8F9.7080706@lucaceresoli.net>
Message-ID: <20110630200323.76aff92d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 30 Jun 2011 18:48:57 +0200,
Luca Ceresoli <luca@lucaceresoli.net> a ?crit :

> and wondered if it's useful to anybody.
> I guess in many embedded systems it is a useless waste of resources.
> At least it is on mine, so I wiped it in my port.
> 
> Out of curiosity, does anybody really use it?
> Or should I send a patch that removes it?

I don't use it, and I don't think many embedded systems have a useful
tty3. So I will definitely ACK a patch that removes it.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
