From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 26 Dec 2014 18:51:12 +0100
Subject: [Buildroot] [buildroot-test 2/2] Enable paranoid path checking
In-Reply-To: <1418852858-818-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1418852858-818-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <549DA010.6040205@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Le 17/12/2014 22:47, Thomas Petazzoni a ?crit :
> Now that Buildroot has support for paranoid path checking (check for
> clearly invalid header and library directories used when
> cross-compiling), let's enable this in the autobuilders.
>
> Without this, the paranoid path checking only emits warnings. With
> this patch enabled, whenever an invalid header or library path is
> used, the build will stop and fail, which will allow us to clearly
> notice such cases.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Do we want to apply this right now? We already have a lot of failures
> caused by the static/shared change. Do we want to have more?
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>
Several packages have already been fixed since this feature has been
added. Enabling this check now will help to discover the remaining
packages left to fix.

Acked-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain
