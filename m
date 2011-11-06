From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2011 16:26:06 +0100
Subject: [Buildroot] buildroot stops at pango compilation
In-Reply-To: <CAC=eiqwhb=ZknTvjhHPquZ-hhtf6u50vNYn6Nc_EPp-ydMtCkQ@mail.gmail.com>
References: <CAC=eiqyR36E133EnLBVZNFWsHzx7ayg0Z=4rq2LWOpYE4xTaMw@mail.gmail.com>
 <CAC=eiqy1_-atsKHX4SE0a_KS1b_qJdzzihr+emoSSY0RDco1mQ@mail.gmail.com>
 <20111106143846.46fa1d9b@skate>
 <CAC=eiqwhb=ZknTvjhHPquZ-hhtf6u50vNYn6Nc_EPp-ydMtCkQ@mail.gmail.com>
Message-ID: <20111106162606.491d895c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please do not reply to me directly, but to the list instead. Thanks!

Le Sun, 6 Nov 2011 20:49:59 +0700,
Daniel Potapov <yeso@bk.ru> a ?crit :

> I removed /usr/local/arm_linux_4.2/bin from PATH and got the same
> results :( My buildroot config in attachments. I'm using Debian 5.0.
> 
> When I compile minimal buildroot configuration (without X server, gtk
> libraries and other) - everything works fine on my target ARM device.

Your config uses the ARM OABI, can you try with ARM EABI, which is the
standard these days ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
