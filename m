From: Joel Carlson <joelsoncarl@gmail.com>
Date: Thu, 19 Jul 2018 12:43:15 -0600
Subject: [Buildroot] SSH and Root password
In-Reply-To: <HE1P18901MB00900DF3E3D543020508F21E97520@HE1P18901MB0090.EURP189.PROD.OUTLOOK.COM>
References: <HE1P18901MB00900DF3E3D543020508F21E97520@HE1P18901MB0090.EURP189.PROD.OUTLOOK.COM>
Message-ID: <CAAjKBV818djjEi8KPipD3i7Us1WHmB62=qzYFnn+c1FFiMLbPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Mahin,

On Thu, Jul 19, 2018 at 12:12 PM, Mahin Hannan <Mahin.hannan@outlook.com> wrote:
> Hi,
>
> I am using ver. 2018.05-rc3 for an Orange Pi Zero board.
>
> I used the configurations that came with buildroot and added; OpenSSH and
> root password was added. I also tried using dropbear instead of the former.
>
> The issue is, I can't log into the board via SSH because my password is
> incorrect.
>
> I've read the other mailing list queries and followed the given solutions,
> but it doesn't work.
>
> How do I set up a root password for the board?

Is the actual error message about an invalid password?  Or is it
perhaps "Permission denied"? I know that when I select openssh on my
boards and have a root password set, I need to have a custom
sshd_config file on the board with "PermitRootLogin yes" set to be
able to ssh in as the root user.

>
> Thanks
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
