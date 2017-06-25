From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Jun 2017 12:36:28 +0200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libnet detection
References: <20170625083749.26322-1-bernd.kuhls@t-online.de>
 <CAFOYHZBgM6XTf2Xah=1fe+w-5Zg+RAky=pSRsT60hs3ij44oCQ@mail.gmail.com>
Message-ID: <XnsA79F804101926berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris Packham <judge.packham@gmail.com> wrote 
in news:CAFOYHZBgM6XTf2Xah=1fe+w-5Zg+RAky=pSRsT60hs3ij44oCQ at mail.gmail.com:

> The usr/bin threw me at first but I assume the configure test looks for
> libnet-config.

Hi Chris,

yes, it does:
https://github.com/balabit/syslog-ng/blob/master/configure.ac#L918

Regards, Bernd
