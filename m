From: Mike Williams <mike@mikebwilliams.com>
Date: Wed, 9 Sep 2015 09:54:22 -0400
Subject: [Buildroot] [PATCHv3] system: add options for /bin /sbin and
 /lib to be symlinks into /usr
In-Reply-To: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
References: <1441397852-23461-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CANPyyuMX7+7D-R=JK+D611mM1O9f5ok8zYwuMtm2O6UwOBXuuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Fri, Sep 4, 2015 at 4:17 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> systemd is increasingly expecting things to live in /usr/bin, /usr/sbin
> or /usr/lib nad not in /bin, /sbin or /lib. It has inherited those
> expectations from a Fedora change:
>     https://fedoraproject.org/wiki/Features/UsrMove

I'm out on vacation, but I'll be back at work on Monday and will test
the latest revision then.

Thanks,
Mike
