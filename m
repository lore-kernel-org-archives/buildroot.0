From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 28 Jul 2016 07:59:46 -0500
Subject: [Buildroot] [PATCH] squashfs: update site to git.kernel.org
In-Reply-To: <20160728100831.5a415350@free-electrons.com>
References: <1469655138-65197-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160728100831.5a415350@free-electrons.com>
Message-ID: <CANQCQpY3ZRoWL96QyHKNNrsOhocnAc_Zgr4-btghdGqCfDVb1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Jul 28, 2016 at 3:08 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Wed, 27 Jul 2016 16:32:18 -0500, Matt Weber wrote:
> > From: Atul Singh <atul.singh.mandla@rockwellcollins.com>
> >
> > squashfs-tools development has been moved to git.kernel.org from
> > Sourceforge.
>
> Yeah, but they haven't made any release since the last one available
> from sourceforge. Are they planning on doing a new release? What is the
> motivation from moving from a stable release to some seemingly random
> Git commit?
>
>
We pulled in that latest hash to fix a threading issue that we were seeing
on our large build machines. When creating images with 64 cores we would
sometimes get corrupted images that would fail to boot.


> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160728/6164d430/attachment.html>
