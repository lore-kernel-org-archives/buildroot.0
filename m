From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 23 Dec 2012 14:29:03 +0200
Subject: [Buildroot] [PATCH] new package: libpciaccess
In-Reply-To: <87y5gpt9h0.fsf@dell.be.48ers.dk>
References: <1356220309-22847-1-git-send-email-stefan.froberg@petroprogram.com>
 <87y5gpt9h0.fsf@dell.be.48ers.dk>
Message-ID: <50D6F90F.7020104@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.12.2012 11:15, Peter Korsgaard kirjoitti:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
>  Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>  Stefan> ---
>  Stefan>  package/Config.in                    |    1 +
>  Stefan>  package/libpciaccess/Config.in       |    6 ++++++
>  Stefan>  package/libpciaccess/libpciaccess.mk |   12 ++++++++++++
>  Stefan>  3 files changed, 19 insertions(+), 0 deletions(-)
>  Stefan>  create mode 100644 package/libpciaccess/Config.in
>  Stefan>  create mode 100644 package/libpciaccess/libpciaccess.mk
>
> Ehh, we already have package/x11r7/xlib_libpciaccess - Any reason you
> cannot use that?
Oh, sorry.
I was doing xserver 1.10 for buildroot 2012.08 and it was complaining
about missing
libpciaccess at some point (or maybe it was one of it's dependency
package that was complaining, can't remember anymore)

Didn't notice that there was already libpciaccess.

Regards
Stefan

> I don't think there's any issue with bumping the version to 0.13.1
>
