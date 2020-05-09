From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:43:28 +0200
Subject: [Buildroot] [PATCH 1/5] package/apparmor: replace deprecated
 egrep with grep -E
In-Reply-To: <20200508081449.GK12536@scaer>
References: <20200508015956.3270405-1-aduskett@gmail.com>
 <20200508081449.GK12536@scaer>
Message-ID: <20200509134328.304963f0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 8 May 2020 10:14:49 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I've not (yet) applied patch 5, because it is sitting somewhere between
> being a feature-patch and being a fix. If is a feature-patch because it
> allows building systemnd with apparmor support, while it is a fix
> because it guarantees build ordering now... So saying I'm torn onthat
> one is a bit strong, but still I am not sure either...

I've decided for you, and applied it to master :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
