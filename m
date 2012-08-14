From: Kevin Broch <kevbroch@gmail.com>
Date: Mon, 13 Aug 2012 17:38:45 -0700
Subject: [Buildroot] building native gcc for target
In-Reply-To: <20120811201643.7413a602@skate>
References: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
 <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
 <5021CE95.9000808@sri.com>
 <CAKWKLJAcKAyfoGX_fx-sFGAAEu88t0hvke_cAm432VYL3DsrWw@mail.gmail.com>
 <20120811201643.7413a602@skate>
Message-ID: <CAKWKLJA0LUAMnhhCsNGR4NCX3Zf0QDYJegGqERTs6NhcAMUh1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas.  Everything is working now.

Best, /<evin


On Sat, Aug 11, 2012 at 11:16 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Wed, 8 Aug 2012 13:16:26 -0700,
> Kevin Broch <kevbroch@gmail.com> a ?crit :
>
> > Thanks for the suggestion.  I unfortunately do not see this "select GCC"
> > option that you suggest.
> > I am using git://git.buildroot.net/buildroot @HEAD
> >
> > - I have selected "Buildroot toolchain" from the Toolchain menu.
> > - Under "Package selection for the target" -> "Development Tools", I see
> a
> > comment
> > "gcc needs development files in target filesystem"
> > but no way to select GCC.
> > As far as I can see the only selecting of GCC goes to which version for
> the
> > cross compiled version.
>
> Build options -> development files in target filesystem
> Packages -> Development tools -> gcc
>
> Note that this is only available if you use "Buildroot toolchain" as
> the toolchain type. We don't support generating gcc for the target with
> the external toolchain and Crosstool-NG toolchain backends.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120813/efd6280b/attachment-0001.html>
