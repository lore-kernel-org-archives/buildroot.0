From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Oct 2018 08:44:44 +0200
Subject: [Buildroot] [PATCH 15/23] python-txtorcon: bump to version
 18.0.2
In-Reply-To: <5baf0f9879876_62ce3fdd0e0b1e2431918@ultri5.mail>
References: <20180926153505.3411-16-asafka7@gmail.com>
 <5baf0f9879876_62ce3fdd0e0b1e2431918@ultri5.mail>
Message-ID: <20181001084444.355723f2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Sep 2018 02:37:28 -0300, Ricardo Martincoski wrote:

> The upstream has a patch related to this (I did not tested it):
> https://github.com/meejah/txtorcon/commit/c160531e885a3695ec1627070b6f48dfc443f3c8
> and also there is a new release 18.1.0 containing it.
> 
> Assuming the patch solves the issue, what would be the best approach in this
> case?
> - resend the remaining patches of the series, bumping directly to 18.1.0;
> - resend the remaining patches of the series, adding the upstream patch to the
>   bump to 18.0.2;
> - apply the remaining patches of the series, and later add a followup patch
>   to solve the runtime issue either by adding the patch file or by bumping to
>   18.1.0.

This last option looks good to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
