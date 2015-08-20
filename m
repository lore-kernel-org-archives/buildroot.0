From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 20 Aug 2015 13:35:00 +0100
Subject: [Buildroot] disabling linux-pam on musl
Message-ID: <CA+BsyQ7_19evrfPvJXoFLSYuUaRk-kQxwYWjkULOCsBwBbGpCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I was about to send a patch disabling linux-pam when musl is being
used. I guess this means that we should also disable its dependencies
on musl too ?

By my reckoning this means disabling the following packages musl.
These implicitly turn on linux-pam.

openvmtools
python-pam
rsh-redone
util-linux

Does that sound sane ?

regards

Brendan
