From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 22:50:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/kmsxx: fix build with gcc 10
In-Reply-To: <20201118171827.1009516-1-fontaine.fabrice@gmail.com>
References: <20201118171827.1009516-1-fontaine.fabrice@gmail.com>
Message-ID: <20201201225055.2de8718e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Nov 2020 18:18:27 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/59f70fb725c2f07e27dc818839e02f2788ee490c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...card.h-to-follow-gcc10-porting-guide.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/kmsxx/0002-added-include-string-to-card.h-to-follow-gcc10-porting-guide.patch

I applied to next, in order to be able to apply Peter Seiderer's
version bump of kmsxx... before I saw that a different gcc 10.x fix was
merged by Peter in master.

Oh well, there's going to be a bit of merge conflict when we'll bring
next back into master...

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
