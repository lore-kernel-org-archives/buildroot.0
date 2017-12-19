From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 18 Dec 2017 23:59:29 -0200
Subject: [Buildroot] [PATCH] gitlab-ci: add .config to artefacts
References: <20171218212558.22912-1-yann.morin.1998@free.fr>
Message-ID: <5a387281cf61_bd03fa772a46ee8855bb@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, Dec 18, 2017 at 07:25 PM, Yann E. MORIN wrote:

s/artefacts/artifacts/g in the subject.

> When a run-time test fails to build, it is interesting to get the
> corresponding .config file directly as an artifact, rather than
> reconstruct it manually from the various config snippets embedded
> in the many runtime-test scripts.

The defconfig is already dumped to the beginning of the build log.

But I agree that having also the .config can be handy (we have both in the
autobuilder results).

[snip]
> ---
>  .gitlab-ci.yml | 1 +
>  1 file changed, 1 insertion(+)

You forgot to duplicate the code to the .gitlab-ci.yml.in

Regards,
Ricardo
