From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 21 Nov 2012 10:42:48 +0100
Subject: [Buildroot] QtWebKit problem
In-Reply-To: <1353490900.77327.YahooMailNeo@web164601.mail.gq1.yahoo.com>
References: <1353490900.77327.YahooMailNeo@web164601.mail.gq1.yahoo.com>
Message-ID: <50ACA218.2030904@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/21/2012 10:41 AM, Zoran Djordjevic wrote:
> I've built linux with Qt support, and later decided to add
> QtWebKit. I checked it, and rebuild (previously deleting
> stamp.build and stamp.install in ../output/build/qt-4.7.4)
> After building I didn't get QtWebKit in .../sysroot/usr/include.
> Where I go wrong ?
> Regards
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Probably you also have to delete the configure stamp as well

-- 
br,
Zoltan Gyarmati
mail: mr.zoltan.gyarmati at gmail.com
freenode nick: zgyarmati
