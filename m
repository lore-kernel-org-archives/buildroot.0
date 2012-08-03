From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Fri, 3 Aug 2012 16:44:13 +0200
Subject: [Buildroot] glibc instead of ulibc ?
In-Reply-To: <1344004327.94147.YahooMailNeo@web164606.mail.gq1.yahoo.com>
References: <1343854870.70701.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <20120801231635.08b7d808@skate>
 <1343913806.30162.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120802152640.5d9cca86@skate>
 <1343936315.31073.YahooMailNeo@web164603.mail.gq1.yahoo.com>
 <20120802214237.37ed2f82@skate>
 <1343944807.21046.YahooMailNeo@web164601.mail.gq1.yahoo.com>
 <20120803150651.6ce383f0@skate>
 <1344004327.94147.YahooMailNeo@web164606.mail.gq1.yahoo.com>
Message-ID: <20120803164413.4313e55b@eb-e6520>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoran,

Le Fri, 3 Aug 2012 07:32:07 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :
> PS I am also suspitious about final success, but I don't know if there is some way to
> programm in some RAD GUI environment?(like Lazarus)?and do crosscompiling.
> 
QTcreator can do that, assuming you have a toolchain with QT
properly integrated, and by providing it a simple helper script
(and having a ssh server with key authentication on your target) you can
even debug from QTCreator using gdb/gdbserver.

Best regards,
Eric
