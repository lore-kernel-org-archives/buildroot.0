From: Axel Lin <axel.lin@ingics.com>
Date: Fri, 13 Dec 2013 09:03:51 +0800
Subject: [Buildroot] [PATCH] xl2tp: bump to version 1.3.2 and add
	licensing info
In-Reply-To: <87ob4l20kf.fsf@dell.be.48ers.dk>
References: <1386811147.8675.2.camel@phoenix> <87ob4l20kf.fsf@dell.be.48ers.dk>
Message-ID: <CAFRkauCtpunXK=AJU80Rc=J8eg=BvbeWadAWjSbA=NkFTf-L7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/13 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:
>
>  > Signed-off-by: Axel Lin <axel.lin@ingics.com>
>
> Thanks, but it seems to have gained a dependency on openssl:
>
> aaa.h:18:25: fatal error: openssl/md5.h: No such file or directory
>
> compilation terminated.
> make[1]: *** [xl2tpd.o] Error 1
> make[1]: *** [avp.o] Error 1
> make[1]: Leaving directory `/home/peko/source/buildroot/output/build/xl2tp-v1.3.2'
> make: *** [/home/peko/source/buildroot/output/build/xl2tp-v1.3.2/.stamp_built] Error 2
Ooops. I didn't hit this in my local build yesterday.
v2 is on the way now.

Thanks,
Axel
