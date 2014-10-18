From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 18 Oct 2014 09:25:42 +0200
Subject: [Buildroot] [V2 0/4] host-perl
In-Reply-To: <87siimdb4m.fsf@dell.be.48ers.dk>
References: <1413009405-13870-1-git-send-email-francois.perrad@gadz.org>
 <87siimdb4m.fsf@dell.be.48ers.dk>
Message-ID: <CAB0FRsuEVJEZKBjnqBaT3n_AFJPPKMGAfcfUOKOaNZTGSVe3MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-10-17 16:27 GMT+02:00 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
>
>  > perl infrastructure using a host-perl instead of the system perl
>  > V1 -> V2:
>  >   - rebase the serie
>  >   - XML-Parser doesn't use the infrastructure
>
>  > Note: no test done for metacity
>
>  > Francois Perrad (4):
>  >   libxml-parser-perl: restore it like before perl infra
>  >   perl: add host variant
>  >   pkg-perl: refactor with host-perl
>  >   perl: remove useless hacks
>
> It seems to cause a number of autobuild failures, could you take a look please?
>
> http://autobuild.buildroot.net/results/688/6881a8f6366085f89bea0d8b3a77fa23af26f3b7/build-end.log
> http://autobuild.buildroot.net/results/d68/d68143ec7745854c97df6c5221b03ff586dec1b1/build-end.log
> http://autobuild.buildroot.net/results/aaf/aaf91380953ebb84c582b38b46cfb180ff6862cb/build-end.log
>

see http://patchwork.ozlabs.org/patch/400614/

Fran?ois

> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
