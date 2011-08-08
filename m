From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Mon, 8 Aug 2011 11:06:30 +0700
Subject: [Buildroot] Still can't boot 2011.05 system
In-Reply-To: <000501cc5580$27ba08e0$772e1aa0$@com>
References: <000501cc5580$27ba08e0$772e1aa0$@com>
Message-ID: <CAG7bwALyLNoyGQzTqoA+vR1kBBTS+pkyLTc+UxaG4QhNK_cpEw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 8, 2011 at 11:03 AM, Sam Nazarko <samnazarko@stmteam.com> wrote:
> Hello,
>
>
>
> I am unable to reply to my existing message because my notifications were
> not set correctly with the mailing list, so I cannot reply to an unsent
> message. A user suggested that my hang (which indeed does occur briefly
> after Starting network..) was a Serial Port issue. I am not sure how to
> resolve this. I have it set to the default of ttyS0 and I even set the
> baudrate to ?kernel default? but this did not resolve the problem. I looked
> at innitab and saw this line:
>
>
>
> ttyS0::respawn:/sbin/getty -L ttys0 0 vt100 #GENERIC_SERIAL

Should this be ttyS0 instead of ttys0 ?

Have you tried with tty1 - ttyNN for example?


-- 
Dwi Sasongko S
