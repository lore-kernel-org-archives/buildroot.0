From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 28 Oct 2020 19:13:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/sslh: fix static build with pcre
In-Reply-To: <875z6ujukk.fsf@dell.be.48ers.dk>
References: <20201015060901.137916-1-fontaine.fabrice@gmail.com>
 <875z6ujukk.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81HUt4GL_P7jMgH90tECNRknBtfE_vPu=CnjmBPECYXzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le mer. 28 oct. 2020 ? 15:26, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Fix static build failure with sslh version 1.19b and above
>
>
>  > Fixes:
>  >  - http://autobuild.buildroot.org/results/a601824fc0c205a6a940e0f9f079ce2c39840605
>
> Hmm, any idea why we only see this with 1.21c on the autobuilders and
> not with 1.20?
Nope, I don't understand why we didn't get this build failure with 1.20.
It should be noted that C++ was, wrongly, mandatory before
35c474f8ee718c7c2189b3e5938337c951a57162, but this should not have
hidden this issue ...
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
