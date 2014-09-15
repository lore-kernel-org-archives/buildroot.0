From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 15 Sep 2014 13:19:06 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <20140915092122.7582b3f9@free-electrons.com>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
 <20140915092122.7582b3f9@free-electrons.com>
Message-ID: <CABbD_XCb4POKdky+D6QPO0+zQSqgr4q0_KDRsHMLkCfzXygB-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

At first sight something happens with the ctng toolchain, while using own
toolchain or Sourcery w/ the same packages/options the problem does not
occur. I'm looking in the x86_64-ctng_locales-linux-gnu toolchain right now.

BR
Karoly

On Mon, Sep 15, 2014 at 9:21 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Karoly Kasza,
>
> On Tue,  2 Sep 2014 18:13:36 +0200, Karoly Kasza wrote:
> > New package: openvmtools
> >
> > Signed-off-by: Karoly Kasza <kaszak@gmail.com>
>
> There are some build failures caused by this new package, see
> http://autobuild.buildroot.org/?reason=openvmtools-9.4.6-1770165. The
> build failure looks like:
>
> syncDriverPosix.c: In function 'SyncDriverIsRemoteFSType':
> syncDriverPosix.c:76:30: error: argument to 'sizeof' in 'strncmp' call is
> the same expression as the second source; did you mean to provide an
> explicit length? [-Werror=sizeof-pointer-memaccess]
>                        sizeof gRemoteFSTypes[i]) == 0) {
>
> Could you have a look at what happens?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140915/ed9c51bc/attachment.html>
