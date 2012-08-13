From: Diego Iastrubni <diegoiast@gmail.com>
Date: Mon, 13 Aug 2012 14:21:19 +0300
Subject: [Buildroot] Login with user fails
In-Reply-To: <3C32AECB8207924A9A228348325DB2D290500A@mntserv.meier-nt.local>
References: <3C32AECB8207924A9A228348325DB2D290500A@mntserv.meier-nt.local>
Message-ID: <CALR4fEKN82anuztvb60ic4OXgSN1C=q_XSBQby_ox3dO7AtueQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I saw this problem once when I worked with static devices (not udev/mdev)
and /dev/tty was missing. I am not sure if this is your problem.

If the user available in /etc/passwd ?

On Mon, Aug 13, 2012 at 12:43 PM, Dirk Lohse <d.lohse@meier-nt.de> wrote:

>  I can't login with other user than root.****
>
> ** **
>
> I can give root an password and can login over serial or ssh. But I can't
> add a new user and login with this one.****
>
> ** **
>
> What I've done:****
>
> # whoami****
>
> root****
>
> # adduser test****
>
> New password: 123456****
>
> Retype password: 123456****
>
> # su test****
>
> Killed****
>
> # echo $?****
>
> 137****
>
> # exit****
>
> Welcome to Buildroot...****
>
> tx28 login: test****
>
> Password: 123456****
>
> ** **
>
> Welcome to Buildroot...****
>
> ** **
>
> ** **
>
> rootfs is mounted in r/w****
>
> ** **
>
> Thank you.****
>
> ** **
>
> bye****
>
> ** **
>
> Dirk****
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120813/f8e6e3c8/attachment.html>
