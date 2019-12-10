From: Aleksander Morgado <aleksander@aleksander.es>
Date: Tue, 10 Dec 2019 20:47:29 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2019-12-09
In-Reply-To: <CAJ4jsaceHWQxOBT=mCgLF1YFhp=BMjCJAs-Vnobs+=PSuAeFTw@mail.gmail.com>
References: <20191210071814.D362187B3D@hemlock.osuosl.org>
 <CAJ4jsaceHWQxOBT=mCgLF1YFhp=BMjCJAs-Vnobs+=PSuAeFTw@mail.gmail.com>
Message-ID: <CAAP7ucKJ53nK=8gAzes-GB-C24dVOD+U7cokhTpzMyVhZo=80Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey Carlos,

On Tue, 10 Dec 2019, 19:20 Carlos Santos, <unixmania@gmail.com> wrote:

> On Tue, Dec 10, 2019 at 4:18 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>
> >     arm      |      modem-manager-1.12.0      | NOK |
> http://autobuild.buildroot.net/results/0ae6ca0b278ca1903057ff6ac31b1b70e8638b9a
> |
>
> This should have been solved by
>
>     https://patchwork.ozlabs.org/patch/1186596/
>
> which was left behind.
>
> Even with that patch applied it fails with...
>


Is there any way I can reproduce that build locally? Not sure how to
exactly reproduce the build with the same toolchain and build options.

Looks like the libmm-glib linker include isn't in the right place when
building some of the tools. I could probably send more patches attempting
to fix this, but I'd be much easier to reproduce locally.

>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191210/13c97fb3/attachment.html>
