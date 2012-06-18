From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Mon, 18 Jun 2012 08:46:36 -0400
Subject: [Buildroot] Has anybody got systemd to work?
In-Reply-To: <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
References: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
 <20120618091508.a0fd469d78e12fcca7fdf4c0@kinali.ch>
Message-ID: <CADiAo4LRnawMEEYcES31KLQKBR7KSYi3wxE0=kt7Pc9aMq64EQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attila,

On Mon, Jun 18, 2012 at 3:15 AM, Attila Kinali <attila@kinali.ch> wrote:

>> I am trying to boot a root FS built with systemd acting as init.
>
> Out of curiosity: Is there any reason why you'd want to use
> systemd in an embedded system? What does it provide that a normal init
> cannot?

I am not targeting an embedded system; rather portable to desktop
range (laptops, small desktops, and those new pocket-size boxes that
can be hooked to a TV/monitor and worked with - I need to build a
compact initial root FS).

Systemd provides asynchronous dependency-based booting (something I
liked in Android init), and some level of containerization (LXC would
be too much for my purpose, but I'd rather use systemd than some
clumsy shell scripts which I tried to achieve the same with).

I use Buildroot because it is a mature toolkit being many years in
active use, with convenient menu configuration.

OTOH I see other developers suggesting more systemd patches (like one
by Maxime Ripard [1] that showed up in the list recently)

Maxime: do you use an alternative toolchain with systemd?

Per my postings some time ago where I suggested adding PAM
capabilities to systemd: I was able to compile systemd with PAM but
was unable to test it because of the parsing problem I ran into (see
the OP).

Thanks.

[1]  http://lists.busybox.net/pipermail/buildroot/2012-June/054903.html

-- 
Dmitry Golubovsky

Anywhere on the Web
