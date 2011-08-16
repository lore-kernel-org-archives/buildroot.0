From: Charles Krinke <charles.krinke@gmail.com>
Date: Tue, 16 Aug 2011 11:22:47 -0700
Subject: [Buildroot] busybox .config
Message-ID: <CALo-6+gPAV892XX=cuDiEiH3WrwORvtFMSh99FObQKV8ZWLn-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, it seems that Mr.Murphy demands I embarrass myself in public once
a week to allow me to see how things work a little bit.

I can see in buildroot/package/busybox/busybox-1.18.x.config which I
believe is the default .config for busybox. Is that correct?

So, I can go "make busybox-menuconfig" and manipulate the .config and
then copy my "tuned" .config to
buildroot/package/busybox/busybox-1.18.x.config and capture the
changes back in svn and sidestep the fact that clean removes the
output directories?

Is this the right path for keeping track of a busybox    .config ??

-- 
Charles Krinke
