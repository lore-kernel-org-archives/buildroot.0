From: Jordon Wu <jordon.wu@gmail.com>
Date: Wed, 2 Dec 2015 12:57:49 +0800
Subject: [Buildroot] [PATCH 1/1] qt5/qt53d: new package
In-Reply-To: <20151201132035.3058e4f6@free-electrons.com>
References: <1448950356-5581-1-git-send-email-jordon.wu@gmail.com>
 <20151201132035.3058e4f6@free-electrons.com>
Message-ID: <CAAH=mgMQagBAV7+c3+QZFsoOwHOzdAkhmDd3-hPrnr6Cs6KK7w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

I tested Peter's patch, It didn't handle qt3d's plugins, qml and examples
cases.

Best Regards
Jordon Wu

2015-12-01 20:20 GMT+08:00 Thomas Petazzoni <
thomas.petazzoni@free-electrons.com>:

> Dear Jordon Wu,
>
> On Tue,  1 Dec 2015 14:12:36 +0800, Jordon Wu wrote:
> > Signed-off-by: Jordon Wu <jordon.wu@gmail.com>
> > ---
> >  package/qt5/Config.in        |  1 +
> >  package/qt5/qt53d/Config.in  | 22 ++++++++++++++++
> >  package/qt5/qt53d/qt53d.hash |  4 +++
> >  package/qt5/qt53d/qt53d.mk   | 61
> ++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 88 insertions(+)
> >  create mode 100755 package/qt5/qt53d/Config.in
> >  create mode 100755 package/qt5/qt53d/qt53d.hash
> >  create mode 100755 package/qt5/qt53d/qt53d.mk
>
> For information, we have already a patch pending to add qt5 3d, from
> Peter Seiderer, which was sent just a few days ago. See:
> http://patchwork.ozlabs.org/patch/547753/.
>
> Maybe you can compare your implementation proposed by Peter (in Cc) and
> see if there's anything to add to Peter's patch ?
>
> Don't hesitate to test Peter's patch and provide your Tested-by if it
> works for you.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151202/940fc91e/attachment-0001.html>
