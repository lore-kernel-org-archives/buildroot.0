From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Feb 2016 21:48:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-02-14
In-Reply-To: <CAFGQKxf1p3JGf_Yo7KF23ge9TNwdrSz-D7CbEx=P6f1KEkomcA@mail.gmail.com>
References: <20160215073024.E815F101D00@stock.ovh.net>
 <CAFGQKxf1p3JGf_Yo7KF23ge9TNwdrSz-D7CbEx=P6f1KEkomcA@mail.gmail.com>
Message-ID: <20160215214851.0129b01f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Martin,

On Mon, 15 Feb 2016 15:10:44 +0000, Martin Bark wrote:

> >       mipsel |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/87e9bbbb36f7fe4868d238ef6a7b72eb8cca7052/
> >       x86_64 |              host-nodejs-5.5.0 | NOK | http://autobuild.buildroot.net/results/f748c0956f71a7857d5cc9ae7bfe3c14357a078a/
> 
> I was able to reproduce the error in host-nodejs and i can confirm my
> patch to update to node 5.6.0
> (http://patchwork.ozlabs.org/patch/581620/) fixes this.  Specifically
> the update i made to
> 0003-Use-a-python-variable-instead-of-hardcoding-Python.patch.

Thanks for looking into this issue. However, at this point, we cannot
merge a bump of nodejs to 5.6.0 to our master branch, because this
branch is "frozen" in terms of version bumps, package additions and
major changes.

Do you think  it is possible to have instead two patches, one that adds
the 0003-Use-a-python-variable-instead-of-hardcoding-Python.patch fix
to NodeJS 5.5.0, so that I can apply it on master, and another patch on
top of it that bumps NodeJS to 5.6.0, which I would apply on our next
branch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
