From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 13 Jun 2016 15:18:59 +0200
Subject: [Buildroot] [PATCH v2 02/14] nxp defconfigs: bump kernel
	version to 4.1.15
In-Reply-To: <74d148e02c32bf6e7b5f945db8e37c4150ab9ff9.1465578220.git.awebster@arcx.com>
References: <cover.1464958470.git.awebster@arcx.com>
 <cover.1465578220.git.awebster@arcx.com>
 <74d148e02c32bf6e7b5f945db8e37c4150ab9ff9.1465578220.git.awebster@arcx.com>
Message-ID: <CAAMH-yupMphdTJssadnYw44W0=+vpMbx=rsBacfL13Ajwezaeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andrew, All,

On Fri, Jun 10, 2016 at 8:09 PM, Andrew Webster <awebster@arcx.com> wrote:
> There is a 1.1.0_ga release, and a 1.1.1_patch release. The
> patch release appears to be only for i.MX6UL, so it is bumped
> to 1.1.1_patch, while the other are 1.1.0_ga.
>
> Signed-off-by: Andrew Webster <awebster@arcx.com>

Although every variation of the mx6 is using the 1.1.0_ga revision in
the Yocto layer, I agree the 1.1.1_patch should be used for the mx6ul
evk since it adds three patches required to handle the 6UL CPU
frequencies properly.

Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>

Regards,
Gary
