From: Julien Boibessot <julien.boibessot@free.fr>
Date: Wed, 16 Aug 2017 12:22:46 +0200
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
Message-ID: <da69dee6-fcee-32c8-c01a-cae9f3788065@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Arnout,

On 10/08/2017 23:01, Arnout Vandecappelle wrote:
>  Hi all,
>
>  A number of defconfigs fail to build (usually the kernel, in one case U-Boot)
> because of GCC 6. Some of these could be fixed by simply bumping the upstream
> kernel; however, we really want defconfigs to be tested on an actual board,
> otherwise there's not much point.
>
>  I've put the people who have been involved in these defconfigs in To. Could you
> look at these defconfigs and try to fix the build with GCC 6? Anything that
> remains unfixed by the end of the month will probably be removed.
>
> ....
>
> armadeus_apf9328_defconfig:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/27873568
>
> ...

As i.MX1 is no more (well) supported in Linux vanilla kernel and APF9328
board is no more recommended for new projects, I think I will send a
patch to remove this defconfig from BR.

OK for you ?

Regards,
