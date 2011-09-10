From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Sep 2011 23:27:29 +0200
Subject: [Buildroot] Adding libev to buildroot
In-Reply-To: <87ipp0ig5t.fsf@macbook.be.48ers.dk>
References: <4E3E72BF.9040302@roth-itk.de>
 <CAGm1_ktR=-TywrmxLORcmG3Hch1=RsqDusL9y+UmJKt6=gT30A@mail.gmail.com>
 <4E3F79CF.40608@roth-itk.de>
 <CAGm1_ktqDGmoRtbWuN8uDM3qiL00K+kS-VbyVcDV3p9sqav9Jg@mail.gmail.com>
 <4E3FE254.7030004@roth-itk.de> <4E3FF8DD.6070507@visionsystems.de>
 <87ipp0ig5t.fsf@macbook.be.48ers.dk>
Message-ID: <CAGm1_kta6RNTeRhJESiJgCv15wHQpDAPb_6hjuY_N7wyOb31PQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Sep 10, 2011 at 5:13 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Yegor" == Yegor Yefremov <yegor_sub1@visionsystems.de> writes:
>
> ?Yegor> Hello Bernhard,
> ?>> I did a patch according to Linus' description.
> ?>> I hope this works and describes clearly the changes I did.
> ?>>
> ?>> Just today I was recompiling a new root filesystem and libev works just like a charm!
> ?>> Keep your good work going, thank you!
>
> ?Yegor> Thank you for the patch. Some remarks below:
>
> ?Yegor> 1. the patches should be sent "inline", so it is easier to comment on them
> ?Yegor> 2. your' Signed-off-by is still missing (see other patches on the list)
> ?Yegor> 3. don't use :=, use = instead
> ?Yegor> 4. this is autotools based package, so following template should be used http://buildroot.uclibc.org/buildroot.html#autotools-tutorial
>
> ?Yegor> I've reworked your patch. So please execute "make clean" or remove all files installed by installation of libev and test it with reworked patch.
>
> Thanks, committed. I took the liberty to add both your signed-off-by's,
> hope that's ok.

Thanks for committing.

Yegor
