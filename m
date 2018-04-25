From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 25 Apr 2018 14:55:38 +0300
Subject: [Buildroot] [PATCH 1/2] configs/solidrun_macchiatobin_*: use a
 Git commit for ATF
In-Reply-To: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
References: <20180423195954.30215-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180425115538.frlmebqn4kjx2ywm@bars>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas and all,

> The version of the ARM Trusted Firmware from Marvell was a Git branch,
> not a Git commit, leading to unreproducible results. So let's use a
> Git commit instead, which is the latest available from the branch that
> was previously used.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Looks good and works fine, thanks !

Tested-by:  Sergey Matyukevich <geomatsi@gmail.com>

Regards,
Sergey
