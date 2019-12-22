From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sun, 22 Dec 2019 06:01:02 -0300
Subject: [Buildroot] [PATCH] package/snort: bump to version 2.9.15
In-Reply-To: <20191221221944.013a16df@windsurf>
References: <20191221153545.7732-1-sergio.prado@e-labworks.com>
 <20191221221944.013a16df@windsurf>
Message-ID: <CANu7NGs8qyQ5seNgACCkKDmtgYX9UWsvr3HQ9dGxtpjLCME1OQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Em s?b., 21 de dez. de 2019 ?s 18:19, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> escreveu:
>
> On Sat, 21 Dec 2019 12:35:45 -0300
> Sergio Prado <sergio.prado@e-labworks.com> wrote:
>
> > Also adds a patch that fixes a build error when cross-compiling
> > on a Fedora host machine.
> >
> > Fixes:
> >
http://autobuild.buildroot.net/results/47a367c2c5cbf13079b0e60ad7ebe3dbd05756d4
> >
http://autobuild.buildroot.net/results/837e43b085ac30fb8545c67352403ceb7de59976
> >
http://autobuild.buildroot.net/results/a69df3959b45620f811c18744aa661caa479aef4
> > many more...
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks, but we want to have separate patches for fixing the build issue
> (which exists with Snort 2.9.14.1) and for bumping the Snort version.
>
> Is there anything that prevents from using your patch dropping the
> Fedora-specific check on 2.9.14.1 ?

No, the Fedora-specific check applies to 2.9.14.1 as well. I will separate
the patches and resend.

Thanks!

Sergio Prado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191222/a2dd4aab/attachment.html>
