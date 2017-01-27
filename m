From: sred_94 at libero.it <sred_94@libero.it>
Date: Fri, 27 Jan 2017 09:31:41 +0100 (CET)
Subject: [Buildroot] R: Re:  install curl-config
Message-ID: <1055550358.5945811485505901491.JavaMail.httpd@webmail-40.iol.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

It would seem that I have solved by specifying the path of curl-config in the 
setup.py of the pycurl module.
Thanks for the support.

Regards,

Simone Rossi


>----Messaggio originale----
>Da: "Peter Korsgaard" <peter@korsgaard.com>
>Data: 26-gen-2017 17.52
>A: "sred_94 at libero.it"<sred_94@libero.it>
>Cc: <buildroot@busybox.net>
>Ogg: Re: [Buildroot] install curl-config
>
>>>>>> "sred" == sred 94 at libero it <sred_94@libero.it> writes:
>
> > Dear Sirs,
> > I am using buildroot 2016.05 and I have installed libcurl library, but
> > I also need curl-config, because it is required by the pycurl package.
>
>What do you mean exactly? It gets installed into
>output/staging/usr/bin. Does pycurl need it at runtime (E.G. on the
>target)?
>
>-- 
>Bye, Peter Korsgaard
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
>
