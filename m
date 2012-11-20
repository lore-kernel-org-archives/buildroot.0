From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Mon, 19 Nov 2012 22:40:04 -0800 (PST)
Subject: [Buildroot] GTK vs Qt
Message-ID: <1353393604.95219.YahooMailNeo@web164605.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When I run GTK demo programs on my ARM board?(built during linux building 
by Buildroot), I start them by quoting it in xinitrc file (together with window 
manager)?and then giving xinit command (is there some other way ?). 
However, when running Qt demo?programs (linux built with Qt support), I can 
start them with quoting only?-qws option (obviously programs are built with
QtCreator) - ie. no xinit ...?
Difference is also regarding startup times (which is?pretty big?difference when
speaking of first start).
What interests me is why different methods of starting GTK and Qt programs and
also why so huge startup?time difference ?
?
Regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121119/d0c968a7/attachment-0001.html>
