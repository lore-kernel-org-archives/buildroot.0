From: Laurent Hartanerot <laurent.hartanerot@gmail.com>
Date: Sun, 22 Mar 2020 16:29:28 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rcw : bump to LSDK-19.09
In-Reply-To: <20200322151829.GF2364@scaer>
References: <20200322103143.18772-1-laurent.hartanerot@gmail.com>
 <20200322131255.GB2364@scaer>
 <CACGVVZg_3UzO=B4ZF5LUTnv+QaDhF3OvcyC_y7wHhnQ1gN5P2A@mail.gmail.com>
 <20200322151829.GF2364@scaer>
Message-ID: <CACGVVZgaDUem-=kenYXu3b+fG2bUHzT55Ohjv7hAGrC4Lgwa1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

That's probably because you already have a python3 installed in your
> machine?
>
Yes it is.

>
> That's exactly the purpose of BR2_PYTHON3_HOST_DEPENDENCY: if the
> build machine already has a python3 (3.4 or later), then there is no
> need to build our own. If the build machine does not already have
> python3 or it is older than 3.4, then we need to build our own.
>
> See:
>     support/dependencies/check-host-python3.mk
>     support/dependencies/check-host-python3.sh
>

I understand that.
But, in this case, we cannot use the syntax ($(HOST_DIR)/bin/python3).
What is the correct syntax ?

> Links:
> > 1. https://patchwork.ozlabs.org/patch/1258063/
> > 2. mailto:yann.morin.1998 at free.fr
> > 3. mailto:laurent.hartanerot at atos.net
> > 4. mailto:laurent.hartanerot at atos.net
> > 5. http://rcw.mk
> > 6. http://rcw.mk
> > 7. http://rcw.mk
> > 8. http://rcw.mk
> > 9. http://rcw.mk
> > 10. https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> > 11. http://lists.busybox.net/pipermail/buildroot/2020-March/277531.html
> > 12. mailto:buildroot at busybox.net
> > 13. http://lists.busybox.net/mailman/listinfo/buildroot
> > 14. http://ymorin.is-a-geek.org/
> > 15. mailto:Laurent.Hartanerot at gmail.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200322/9f4db92f/attachment.html>
