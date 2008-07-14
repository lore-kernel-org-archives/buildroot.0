From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Mon, 14 Jul 2008 11:33:21 +0300
Subject: [Buildroot] alsa unknown ioctl
In-Reply-To: <408540dd0807132122y2c49881dy964c9caf9732622f@mail.gmail.com>
References: <408540dd0807132122y2c49881dy964c9caf9732622f@mail.gmail.com>
Message-ID: <487B0F51.7090702@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

 > ALSA sound/core/control.c:1224: unknown ioctl = 0xc2c85512
 >
 > alsamixer: function snd_mixer_load failed: Inappropriate ioctl for device.


Try to check this previous buildroot thread:
http://busybox.net/lists/buildroot/2007-November/006326.html


BR,
Ivan
