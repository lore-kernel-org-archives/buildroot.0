From: sambuff <samuel.buffet@gmail.com>
Date: Wed, 22 Jan 2014 11:57:10 -0800 (PST)
Subject: [Buildroot] python Gobject
In-Reply-To: <20140121173657.GA11605@pc-eric>
References: <CAAs3wMgAbEnReJ-XW_QnQ=kAU6G7cwzss7yUMytcmHMRYMsjnw@mail.gmail.com>
 <20140117113153.GB10730@pc-eric>
 <CAAs3wMh5xwOK_bEDVM1JMJvw6vYYL2frZYxTc_4ehyLK2sj++g@mail.gmail.com>
 <20140117154452.GC10730@pc-eric> <1390290077263-60414.post@n4.nabble.com>
 <20140121173657.GA11605@pc-eric>
Message-ID: <1390420630566-60535.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric Hi,

>D'Oh! I forgot to add 'python' after 'host-python' in
>package/python-gobject/python-gobject.mk.
>
>I reworked the package and added proper support for PyGtk. Development now
>takes place in https://github.com/elebihan/buildroot/tree/pygtk-support/.
>The complete stack has been added: 

Cool !  I'll take a look to pygtk also later on.

Regarding the 'python-gopbject' package I've tried to add 'python' after
'host-python' as you said. And I've also tried your new package in
https://github.com/elebihan/buildroot/tree/pygtk-support/. but I still have
the "missing headers" error. Haven't you got yourself this error with your
last branch ?

Thanks again :)
Sam



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/python-Gobject-tp60199p60535.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
