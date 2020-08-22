From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Sat, 22 Aug 2020 12:18:12 +0200
Subject: [Buildroot] Error configuring eudev
In-Reply-To: <20200821161334.GB17579@scaer>
References: <CAOiXNkBVORsGuNporGcJhsWOYy06auQ3Mkfh0kh6ZHkyt7qmxQ@mail.gmail.com>
 <20200821161334.GB17579@scaer>
Message-ID: <CAOiXNkDibJeyu-QkoO9cdoh1xaC=F=Y=my1srC17GoLGOMkMcA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> > checking for blkid >= 2.20... no
> > configure: error: *** blkid support requested but not found
>
> This is usually the case when you change some settings in the
> menuconfig, but do not start the build from scratch:
>
>     https://buildroot.org/downloads/manual/manual.html#full-rebuild
>
> Did you run 'make clean' before restarting your build? If not, try so.

make clean solved the problem. Beginners mistake :-)
Thank you Yann very much!

Best regards,
Andrey.
