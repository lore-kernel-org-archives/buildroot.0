From: Xavier Ruppen <xruppen@gmail.com>
Date: Sun, 3 Mar 2019 22:55:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix "Timed out waiting
 for device /dev/console."
In-Reply-To: <20190303213751.GM2721@scaer>
References: <20190303113052.9120-1-xruppen@gmail.com>
 <20190303115413.GG2721@scaer>
 <87o96rk8m0.fsf@dell.be.48ers.dk> <20190303204826.GL2721@scaer>
 <87a7ibk62d.fsf@dell.be.48ers.dk> <20190303213751.GM2721@scaer>
Message-ID: <CABjkB-SxZz4B1+B2H-LHcmZp7nAaObNpygHEMM6pbC4di9NgCw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, hi Peter,

Indeed, I didn't catch this as it works nonetheless, sorry about that.

The "console-getty at console.service" doesn't worry me too much, even though
I agree we should have "console-getty.service" instead. On the other hand, the
broken symlink to "lib/systemd/system/console-getty at .service" must be fixed.

> Xavier, if this is the case, please say so in the commit log. If I wrote
> bullsh!t, then please also say so, and then explain how your patch makes
> it work.

I am no expert in systemd either but I think you're right. I will have
a look during
the week and post a v3.

Best regards,

Xavier
