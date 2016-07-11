From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 11 Jul 2016 20:56:47 -0300
Subject: [Buildroot] [PATCH 2/2] uboot-tools: bump to version 2016.07
In-Reply-To: <877fcr95dd.fsf@dell.be.48ers.dk>
References: <1468269786-23212-1-git-send-email-festevam@gmail.com>
 <1468269786-23212-2-git-send-email-festevam@gmail.com>
 <877fcr95dd.fsf@dell.be.48ers.dk>
Message-ID: <CAOMZO5BMTGwd1aEmFHVdwk=wFyhVdT0in30NCBgbC1KFN_m2fA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 11, 2016 at 7:28 PM, Peter Korsgaard <peter@korsgaard.com> wrote:

> Did you test this? The patches don't even apply:
>
> Applying 0003-Make-FIT-support-really-optional.patch using patch:
> patching file common/bootm.c
> Hunk #1 succeeded at 901 (offset 10 lines).
> Hunk #2 succeeded at 966 (offset 10 lines).
> patching file include/bootm.h
> patching file tools/Makefile
> Hunk #2 FAILED at 69.
> 1 out of 2 hunks FAILED -- saving rejects to file tools/Makefile.rej
> package/pkg-generic.mk:165: recipe for target '/home/peko/source/buildroot/output-htop/build/host-uboot-tools-2016.07/.stamp_patched' failed

Ops, sorry about that. It applies against 2016.07-rc3, but not against
the final 2016.07.

I adjusted patch 0003 so that it can apply cleanly and sent a v2.

My build test was to build mx51evk with 2016.07, but it did not cause me errors.
