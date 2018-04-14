From: =?utf-8?Q?Sh=C3=A9rab?= <Sebastien.Hinderer@ens-lyon.org>
Date: Sat, 14 Apr 2018 12:17:38 +0200
Subject: [Buildroot] keyboard: accented letters not working
Message-ID: <20180414101738.GA5659@pema>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Buildroot friends,

On a BR system:

- kbd_mode reports that the keyboard is in Unicode (UTF-8) mode

- French layout has been loaded: it's azerty and not qwerty

- Still, accented letters do not work: typing ? produces {, typing ?
produces ^i, etc.

Any idea about what could be misconfigured,please?

Many thanks!

Sh?rab.
