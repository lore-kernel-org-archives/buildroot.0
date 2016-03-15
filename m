From: Ricardo Crudo <ricardo.crudo@gmail.com>
Date: Tue, 15 Mar 2016 15:39:04 +0100
Subject: [Buildroot] [PATCH 1/1] mxml: add host-autotools-package macro
In-Reply-To: <20160315143838.2683f35c@free-electrons.com>
References: <1458041510-19966-1-git-send-email-ricardo.crudo@gmail.com>
 <20160315143838.2683f35c@free-electrons.com>
Message-ID: <CAPjqk-+dBjt-XZ7HY6UvuHO51U+JF8P4oEshSiHYsjbMeCVECQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Could you define "some" by giving some examples of package that will
need that?

None present on buildroot now, only in my user packages. They are LV2
plugins, one I remind now is ZynAddSubFX (
http://zynaddsubfx.sourceforge.net/).

> When possible, we try to avoid having "orphan" host packages, i.e host
packages whose build cannot be triggered at all because no other
packages depend on them.

Because there is no way to apply patch to global packages (according irc
response) on buildroot I'm seding the patch as it was recommended on
buildroot irc channel.

Regards,
Ricardo.


On Tue, Mar 15, 2016 at 2:38 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Ricardo Crudo,
>
> On Tue, 15 Mar 2016 12:31:50 +0100, Ricardo Crudo wrote:
> > Some packages need to process xml at host side
>
> Could you define "some" by giving some examples of package that will
> need that?
>
> When possible, we try to avoid having "orphan" host packages, i.e host
> packages whose build cannot be triggered at all because no other
> packages depend on them.
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160315/7d2810c8/attachment.html>
