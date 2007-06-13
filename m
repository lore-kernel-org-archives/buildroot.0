From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 13 Jun 2007 15:40:54 +0200
Subject: [Buildroot] uclibc.mk breaks target .config
In-Reply-To: <20070613124624.GA10380@z1.synertronixx>
References: <20070613124624.GA10380@z1.synertronixx>
Message-ID: <20070613134054.GA28888@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 13, 2007 at 02:46:25PM +0200, Konstantin Kletschke wrote:
>I am trying to assign mine .config file for the uClibc.
>This works fine but the uclibc.mk breaks things doing a simple
>"/bin/echo "CONFIG_ARM_EABI=y" >> .config" to the bottom of the config.
>After that the uClibc build is so confused that it asks about the eabi:
>
>konsti at z1:/usr/src/uClibc$ /bin/echo "CONFIG_ARM_EABI=y" >> .config
>konsti at z1:/usr/src/uClibc$ make oldconfig

>If I let the uclibc.mk do all its echo stuff, the build does not even ask 
>for interaction but falls back to a generic arm OABI build.

Do i understand you correctly that everything works fine unless you do
something you are not supposed to do?
>
>How am I to solve this without rewriting the whole uclibc.mk?

please do if you feel like.

>The version I am trying to use is a uclibc-snapshot.

The files you're supposed to read is docs/*
It is generally a good idea to do this before doing something stupid, 
ranting and babbling shZ()t like "duh! must.. rewrite.. everything..
duh!"
