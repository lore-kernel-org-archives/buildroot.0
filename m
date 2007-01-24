From: Elric Milon <elric-brl@ikuszen.com>
Date: Wed, 24 Jan 2007 13:55:57 +0100
Subject: [Buildroot] My first patch :-) (updated soekris support)
In-Reply-To: <200701221950.27856.elric-brl@ikuszen.com>
References: <200701221950.27856.elric-brl@ikuszen.com>
Message-ID: <200701241355.57979.elric-brl@ikuszen.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El Lunes 22 Enero 2007 19:50, Elric Milon escribi?:
> Well, this is the first one, it unbreaks soekris 4801 support, and updates
> the kernel used to 2.6.19.2 version.
>
> I'ts my first patch, so maybe something is not right. Constructive
> cryticism is welcome :-)
>
> Regards!

Ok, second attempt, smaller patch and cleaner.

Remember to delete:

target/device/Soekris/net4801/linux*.mk
target/device/Soekris/net4801/linux.config

It's not used anymore.

;-)

-- 

        Elric Milon Beltran
        ZEN Programari lliure i xarxes SLL
        www.ikuszen.com | www.grupoikusnet.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: soekris-support.diff.bz2
Type: application/x-bzip2
Size: 14140 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070124/4f1742cd/attachment.bin 
