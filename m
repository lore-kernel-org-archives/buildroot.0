From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 10 May 2020 12:19:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: fix build with
 musl-1.2.0
References: <20200503075312.703486-1-bernd.kuhls@t-online.de>
 <20200509233034.40e44309@windsurf.home>
Message-ID: <d31logxi7t.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 09 May 2020 23:30:34 +0200 schrieb Thomas Petazzoni:

> So the big question is why does minidlna wants to do the syscall
> directly instead of using clock_gettime(), which is the right thing to
> do ?

Hi Thomas,

no idea, let's wait for an upstream reponse to my patch.

Regards, Bernd
