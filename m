From: Philippe Ney <philippe.ney@pardes.ws>
Date: Fri, 23 Feb 2007 09:19:15 +0100
Subject: [Buildroot] make menuconfig in a buildroot env.
In-Reply-To: <20070222195010.GA30949@zelow.no>
References: <20070222195010.GA30949@zelow.no>
Message-ID: <20070223091915.8209f683.philippe.ney@pardes.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I've made a buildroot development environment and have a buildroot
> checkout in it.
[...]
> root at hamp buildroot.rolls]# make menuconfig
> make -C package/config ncurses conf mconf
> make[1]: Entering directory `/buildroot.rolls/package/config'
> make[1]: `conf' is up to date.

Hi,

I like starting my messages with something like 'hi', 'hello' or 'yo
guys'. I don't know exactly why. Maybe... respect. And this even if my
response is not the right one.

Have you try :

>$ make -C package/config clean

Seems you have updated some of your tools without having cleaned your
half-built buildroot.

Philippe
