From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jan 2013 22:42:47 +0100
Subject: [Buildroot] [PATCH 2/5] docs/manual: mention the new post-image
 mechanism
In-Reply-To: <201301162106.06305.yann.morin.1998@free.fr>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <201301162106.06305.yann.morin.1998@free.fr>
Message-ID: <20130116224247.6f94a532@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 16 Jan 2013 21:06:06 +0100, Yann E. MORIN wrote:
> Thomas, All,
> 
> On Wednesday 16 January 2013 Thomas Petazzoni wrote:
> > Signed-off-by: Thomas Petazzoni
> > <thomas.petazzoni@free-electrons.com> ---
> >  docs/manual/customize-rootfs.txt |   15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> 
> Why did you split the doc-patch out of the feature-patch?
> 
> I would expect that documentation is committed in the same changeset
> as the feature (or bug-fix) it relates to.

Simply because not having the documentation doesn't prevent the feature
from working, but it makes the patch smaller, so easier to review, in
my opinion.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
