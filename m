From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 6 Nov 2012 22:03:22 +0100
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
 <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
 <50986270.4070804@mind.be>
Message-ID: <qutb7k.9fm.ln@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote in 
news:50986270.4070804 at mind.be:

>   Is it possible that this is because the target binary is created with
> kernel headers 3.2, but you're running it on a host which is only 2.6.32
> (squeeze)?  But then it should work on wheezy, because that has 3.2 as
> well (at least since about four months IIRC).  Although...  240 on i386
> is futex, which has existed already since long before 2.6.32.

Hi,

on wheezy I am using kernel 3.5.5.

$ LC_ALL=C apt-cache policy linux-image-3.5-trunk-amd64
linux-image-3.5-trunk-amd64:
  Installed: 3.5.5-1~experimental.1
  Candidate: 3.5.5-1~experimental.1

Kind regards, Bernd
