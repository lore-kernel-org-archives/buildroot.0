From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 21 Feb 2020 11:19:47 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <CAGSpp9=qDFdtuETT8shQPXim25V7Yw2jvpjihbJgrttozOBVSQ@mail.gmail.com>
References: <CAGSpp9=qDFdtuETT8shQPXim25V7Yw2jvpjihbJgrttozOBVSQ@mail.gmail.com>
Message-ID: <20200221111947.33e4677d@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Hammami,

On Fri, 21 Feb 2020 10:13:17 +0100, Hammami Omar <omar18hammami@gmail.com> wrote:

> Hello,
>
> I am using the buildroot version "2019.11.1" and I have noticed that my SSH
> server starts too late.
> I was using an old version "2017.08" and the SSH server was starting
> normally.
> Are you aware of this issue please ?
> And do you propose a workaround for this ?

What exactly do you mean by 'to late'? Which init system do you use?

On first boot the ssh keys must be generated (which can use some time
depending on the hardware and the random source)...., random generation
can be speed up by e.g. using/enabling haveged...

Regards,
Peter

> And thank you very much.
>
> Best regards,
> omar
