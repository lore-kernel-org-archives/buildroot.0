From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 25 Jan 2016 23:17:34 +0100
Subject: [Buildroot] ssh: connect to host pi adress port 22: Connection
 refused
In-Reply-To: <20160125093723.32061baa@free-electrons.com>
References: <CABi8WTyCkO0dbH0GKkwV+C4Hb_OtaPipk06zBuNCuDJoHK7bLA@mail.gmail.com>
 <20160125093723.32061baa@free-electrons.com>
Message-ID: <20160125231734.12073cda@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello FrAnKenStEiN MC,

On Mon, 25 Jan 2016 09:37:23 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Mon, 25 Jan 2016 02:37:18 +0000, FrAnKenStEiN MC wrote:
> 
> > But whe trying ssh i get `connection refused`
> > 
> >     ssh pi at 10.42.0.5
> >     ssh: connect to host 10.42.0.5 port 22: Connection refused
> > 
> > I couldn't solve this problem all the day !!!
> 
> Plug a serial port adapter on your RPi, and look at the boot messages,
> and see if dropbear gets started, and if it does, see if there are any
> error message.

With buildroot from git (as of today) it worked for me (both cases ro and rw
root filesystem)...., any chance to plugin a hdmi monitor (besides from a
serial console) to get access to the last lines of boot messages?
Mind to share your buildroot config file? How did you configure your ip
adress, via cmdline.txt?

Regards,
Peter

> 
> Best regards,
> 
> Thomas
