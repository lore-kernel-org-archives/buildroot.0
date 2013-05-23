From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 23 May 2013 07:44:03 -0700
Subject: [Buildroot] [PATCH 2/5] tvheadend: needs threads
In-Reply-To: <20130523065406.GC3373@free.fr>
References: <1369268647-13128-1-git-send-email-gilles.talis@gmail.com>
 <1369268647-13128-2-git-send-email-gilles.talis@gmail.com>
 <20130523065406.GC3373@free.fr>
Message-ID: <CAKcgs2zzTjEqhz33n2foQGGOLoR4ymsp45brszkYNcu3Gxcz+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all,

2013/5/22 Yann E. MORIN <yann.morin.1998@free.fr>:
> Gilles, All,
>
> Is it because tvheadend selects dvb-apps that it requires threads, or
> does it itself require threads?
>
It is tvheadend that needs threads. It is not dvb-apps that requires
threads, but dvb-apps utils.
By the way, thanks for the ack on my dvb-apps utils patch.

Regards,
Gilles.
