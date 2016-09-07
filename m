From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 7 Sep 2016 16:43:25 +0200
Subject: [Buildroot] [PATCH v2,1/1] gtest: retrieve package from github
In-Reply-To: <20160907163123.1d80717f@free-electrons.com>
References: <1472660994-23034-1-git-send-email-fabrice.fontaine@orange.com>
 <20160906231857.60082e09@free-electrons.com>
 <1114700254.3685952.1473258255325.JavaMail.zimbra@datacom.ind.br>
 <20160907163123.1d80717f@free-electrons.com>
Message-ID: <CAPi7W80RKmviFzO5ja690-0H1ckTNMw40hrhxAecEN3mONQLWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear all,

I sent a new patch, your comments are welcome.

Best Regards,

Fabrice

2016-09-07 16:31 GMT+02:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Hello,
>
> On Wed, 7 Sep 2016 11:24:15 -0300 (BRT), Carlos Santos wrote:
>
> > > I guess moving to using the CMake based build system would make more
> > > sense, but that's a bigger task.
> > >
> > > Patches welcome :)
> >
> > A patch was sent a long time ago, but was rejected[1]. I will update it
> and resubmit for review.
> >
> > 1. http://patchwork.ozlabs.org/patch/586130/
>
> Well, the patch says:
>
> """
> 2) There is no tag corresponding to gmock 1.7.0. We circumvent this by
>    refering to the commit id corresponding to gmock 1.7.0.
> """
>
> But this is not really true, in the
> https://github.com/google/googlemock/ repository, you do have the older
> 1.7.0.
>
> Also, your patch was using the autotools build process for gmock, which
> caused problems with ax_pthread.m4. Isn't switching to the CMake build
> process a better idea here, since gtest is anyway already using CMake ?
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160907/e69a9b85/attachment.html>
