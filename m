From: Jaap Crezee <jaap@jcz.nl>
Date: Mon, 23 Nov 2015 18:34:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 4.2.2
In-Reply-To: <1448228400-25407-1-git-send-email-martin@barkynet.com>
References: <1448228400-25407-1-git-send-email-martin@barkynet.com>
Message-ID: <56534E27.7050408@jcz.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On 11/22/15 22:40, Martin Bark wrote:
> v4.2.2 is the current Long Term Support (LTS) version

Agree, would be nice to have that in BR.

> Moved all v4.1.2 patches to v4.2.2 except 0004-fix-arm-vfpv2.patch as this
> is no longer needed.  Instead use the new --with-arm-fpu configure option.
> See https://github.com/nodejs/node/issues/2942 and
> https://github.com/nodejs/node/pull/3228.
> 
> Also, with the introduction of --with-arm-fpu rename NODEJS_ARM_FP to
> NODEJS_ARM_FLOAT_ABI to make nodejs.mk more readable.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

This looks good (not tested yet, will do wednesday), however: I think BR would also
benefit on a global level for something like this. Something like that was hinted in one
of the previous nodejs emails.

regards,

Jaap
