From: Hammami Omar <omar18hammami@gmail.com>
Date: Fri, 21 Feb 2020 15:50:55 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <20200221111947.33e4677d@gmx.net>
References: <CAGSpp9=qDFdtuETT8shQPXim25V7Yw2jvpjihbJgrttozOBVSQ@mail.gmail.com>
 <20200221111947.33e4677d@gmx.net>
Message-ID: <CAGSpp9nYVE28LS2F5y97Xc0X_oXVJa8HDOiZKj73N7LOgMyGMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

Thank you very much for your response.

By too late, I mean that my ssh server starts ~20 seconds later comparing
to the normal  (Old buildroot version in my case).
Also, I am using the busybox init system. And I am thinking to use the
systemd init system, so that I can see the dependencies of the ssh process
and their execution time.

Now I have one question about haveged:
Is haveged used only with systemd init system ? Or it can be used also with
busybox init system ?
Is it possible to enable havged from menuconfig of buildroot ?

Best regards,
omar

Le ven. 21 f?vr. 2020 ? 11:19, Peter Seiderer <ps.report@gmx.net> a ?crit :

> Hello Hammami,
>
> On Fri, 21 Feb 2020 10:13:17 +0100, Hammami Omar <omar18hammami@gmail.com>
> wrote:
>
> > Hello,
> >
> > I am using the buildroot version "2019.11.1" and I have noticed that my
> SSH
> > server starts too late.
> > I was using an old version "2017.08" and the SSH server was starting
> > normally.
> > Are you aware of this issue please ?
> > And do you propose a workaround for this ?
>
> What exactly do you mean by 'to late'? Which init system do you use?
>
> On first boot the ssh keys must be generated (which can use some time
> depending on the hardware and the random source)...., random generation
> can be speed up by e.g. using/enabling haveged...
>
> Regards,
> Peter
>
> > And thank you very much.
> >
> > Best regards,
> > omar
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200221/10edb879/attachment.html>
