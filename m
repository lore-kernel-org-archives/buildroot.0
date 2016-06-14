From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 14 Jun 2016 14:40:28 +0200
Subject: [Buildroot] Clean and rebuild rootfs.ext2 and rootfs.tar
In-Reply-To: <20160614135246.1b62f776@free-electrons.com>
References: <CALtfCQYcXvZLsVhNAzZ_wdR=R9-rw72cw7BvNvDM2nSEwAcM1A@mail.gmail.com>
 <20160614103400.GH2749@tarshish> <20160614135246.1b62f776@free-electrons.com>
Message-ID: <CALtfCQYBh3+QYq42mUuofX5HgqqXPTrD8FjO6taDq=KK247Fjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok thank you everyone,

I think I was doing something wrong.

Best regards.

[image: photo] ?scar G?mez Fuente
Electronic Engineer & Degree in Physical Sciences
Mobile: 659.28.97.90
Email: oscargomezf at gmail.com
Website: www.oscargomezf.com
<http://facebook.com/oscargomezf>  <http://plus.google.com/oscargomezf>
<http://us.linkedin.com/in/oscargomezf>
<http://twitter.com/oscargomezf_com>

On 14 June 2016 at 13:52, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 14 Jun 2016 13:34:00 +0300, Baruch Siach wrote:
>
> > On Tue, Jun 14, 2016 at 11:32:32AM +0200, Oscar Gomez Fuente wrote:
> > > Is there any way to clean the files: rootfs.ext2 and rootfs.tar and
> rebuild
> > > them again? I only want to guarantee that my rootfs.ext2 and
> rootfs.tar are
> > > updated. Up to know I was using: make clean && make, but I spend a lot
> of
> > > time.
> >
> > Just deleting these files and running 'make' should do the trick.
>
> You don't even need to delete these files. Just run "make", and all
> filesystem images are re-generated at every "make" invocation.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160614/4df7dc20/attachment.html>
