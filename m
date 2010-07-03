From: Mitch Davis <mjd+buildroot@afork.com>
Date: Sun, 4 Jul 2010 09:30:39 +1000
Subject: [Buildroot] qt ,buidroot and media files
In-Reply-To: <AANLkTilZ88rTjESzVeJHJewxPYakrHPsOzJc78DO9Qgj@mail.gmail.com>
References: <AANLkTilZ88rTjESzVeJHJewxPYakrHPsOzJc78DO9Qgj@mail.gmail.com>
Message-ID: <AANLkTik1U67fkAFZnj5OKS3fQHpNnPEX3h6oVsg7J0WS@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 3, 2010 at 6:53 PM, Mahmoud Mamdouh
<mamdouh.al.shamy@gmail.com> wrote:
> i made FS using Buildroot and BusyBox
> ,included Qt framework with phonon modules
> ,then cross compiled Qt media application for my board "Mini2440"

Which sound system have you compiled into the kernel?  ALSA?  If so,
can you show us the contents of /proc/asound/cards and
/proc/asound/devices?  After that, please run alsa-info.sh.  The
output from that command will tell us a lot about what's going on.

(And is there anything relevant to playing sound in /var/log/messages?)

Mitch.
