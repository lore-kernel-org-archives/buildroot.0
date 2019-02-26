From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Feb 2019 08:25:22 +0100
Subject: [Buildroot] [git commit] package/iproute2: backport patch to
 fix compilation under glibc < 2.18
In-Reply-To: <87h8creaa7.fsf@dell.be.48ers.dk>
References: <20190225212703.ACC728E2B8@busybox.osuosl.org>
 <87h8creaa7.fsf@dell.be.48ers.dk>
Message-ID: <20190226082522.58423472@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 26 Feb 2019 00:08:32 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> We don't really support such old glibc versions since 2017.08. From
> CHANGES:
> 
> 2017.08-rc1, Released August 2nd, 2017
> 
>         Toolchain:
> 
>         - CodeSourcery toolchains for x86 and SuperH have been
>           removed, they were using a too old glibc version
>           (2.17). External toolchains with glibc 2.17 or earlier are
>           no longer supported.
> 
> 
> But OK, the patch is small and already accepted upstream.

Yes, the patch was already upstream, which is what convinced me to
apply this.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
