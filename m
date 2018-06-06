From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 6 Jun 2018 14:14:17 -0300 (BRT)
Subject: [Buildroot] swapoff, but no swapon in initab
Message-ID: <509563228.1507483.1528305257656.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm working on a product that needs a swap partition and noticed that
both package/{busybox,sysvinit}/inittab invoke "swapoff -a" in their
shutdown sequences but do not invoke "swapon -a". Is this intentional
or the swapon call is missing (e.g. right after "mount -a")?

BTW, what about systemd?

-- 
Carlos Santos (Casantos) - DATACOM, P&D
Rua Am?rica, 1000 - Eldorado do Sul, RS, Brasil - 92990-000
casantos at datacom.com.br          +55 51 3933.3000 ext. 3627
http://www.datacom.ind.br
