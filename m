From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 13 Mar 2021 17:08:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/ushare: bump to version 2.1
In-Reply-To: <87lfar3xkx.fsf@dell.be.48ers.dk>
References: <20210222071301.220417-1-fontaine.fabrice@gmail.com>
 <87lfar3xkx.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W81k7caNNYozxzsCy-e49amKayqxPUUcmQygbRO-hFvqVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le sam. 13 mars 2021 ? 16:03, Peter Korsgaard <peter@korsgaard.com> a ?crit :
>
> >>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
>
>  > Fix SOAP action responses which are broken since the switch to latest
>  > version of libupnp (1.14.x) in version 2.0
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> For my understanding, is this only broken in 2.0 or also in 1.1a +
> libupnp patches like we use in 2020.02.x / 2020.11.x?
It's also broken on 2020.02.x and 2020.11.x because of
0004-switch-to-libupnp-1.14.x-API.patch
https://github.com/ddugovic/uShare/commit/9ef0ac7196f316c683ef01b15c60a39bdb64a953
should be applied on those versions.
>
> --
> Bye, Peter Korsgaard
Best Regards,

Fabrice
