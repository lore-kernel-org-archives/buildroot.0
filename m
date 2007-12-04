From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Tue, 4 Dec 2007 21:55:34 +0200 (EET)
Subject: [Buildroot] Anyone familiar with PLX PCI driver? Otherwise,
 general driver question...
In-Reply-To: <585368.50101.qm@web51907.mail.re2.yahoo.com>
References: <585368.50101.qm@web51907.mail.re2.yahoo.com>
Message-ID: <55534.127.0.0.1.1196798134.squirrel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


You may want to try insmod/rmmod from module-init-tools package (not included in buildroot)
and check if your module get loaded.

Regards,
Ivan


> Hello -
>
>   Does anyone have specific experience with loading a
> PLX-born driver into uCLinux? I'm trying to get it to load
> but it refuses and don't know the specific things to check
> as to why... (I do have insmod available and can execute it
> in the command line of the embedded system. it says "... no
> symbols ... (stripped?)...module not loaded")
>
