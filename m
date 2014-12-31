From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 08:47:22 +0100
Subject: [Buildroot] [PATCH v2] dnsmasq: install DBus configuration file
In-Reply-To: <CAGm1_kuhs2U1RsvYV9D6qD6XxZEHUON_qE-ERsoj3ge8GaEt9A@mail.gmail.com>
References: <1419972927-25825-1-git-send-email-yegorslists@googlemail.com>
 <20141230224419.5288c872@free-electrons.com>
 <CAGm1_kuhs2U1RsvYV9D6qD6XxZEHUON_qE-ERsoj3ge8GaEt9A@mail.gmail.com>
Message-ID: <20141231084722.3f3684c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed, 31 Dec 2014 00:18:17 +0100, Yegor Yefremov wrote:

> > Sorry, should have said that on the previous iteration: please add -m
> > 0644 to the $(INSTALL) invocation.
> 
> Should I apply these changes to wpa_supplicant too? I borrowed the code there.

Yes, doing those changes on wpa_supplicant would be good. Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
