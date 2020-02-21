From: Hammami Omar <omar18hammami@gmail.com>
Date: Fri, 21 Feb 2020 19:30:44 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <r2p6br$27r7$1@ciao.gmane.io>
References: <CAGSpp9=qDFdtuETT8shQPXim25V7Yw2jvpjihbJgrttozOBVSQ@mail.gmail.com>
 <20200221111947.33e4677d@gmx.net>
 <CAGSpp9nYVE28LS2F5y97Xc0X_oXVJa8HDOiZKj73N7LOgMyGMA@mail.gmail.com>
 <r2p6br$27r7$1@ciao.gmane.io>
Message-ID: <CAGSpp9ktPHnTeqQ2VkVW4D31QKMb68gBATkHo3PaW9NemeY8nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hello Grant,

No, I have always the same "/var/ssh_host_rsa_key"
The haveged script was started, I have very high value of entropy (2332)
and the sshd process started too late.


Le ven. 21 f?vr. 2020 ? 19:10, Grant Edwards <grant.b.edwards@gmail.com> a
?crit :

> On 2020-02-21, Hammami Omar <omar18hammami@gmail.com> wrote:
>
> > By too late, I mean that my ssh server starts ~20 seconds later comparing
> > to the normal  (Old buildroot version in my case).
>
> Does it generate a new host key each time it starts?
>
> --
> Grant Edwards               grant.b.edwards        Yow! Is a tattoo real,
> like
>                                   at               a curb or a battleship?
>                               gmail.com            Or are we suffering in
>                                                    Safeway?
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200221/b550efcd/attachment.html>
