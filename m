From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 25 Feb 2016 07:53:05 -0300
Subject: [Buildroot] [PATCH 2/2] gcc: remove 4.5.x
In-Reply-To: <87h9gxxgc7.fsf@dell.be.48ers.dk>
References: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
 <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
 <87io1d3mhr.fsf@dell.be.48ers.dk>
 <20160225104848.2f5d892f@free-electrons.com>
 <87h9gxxgc7.fsf@dell.be.48ers.dk>
Message-ID: <56CEDD11.7060603@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/02/16 06:57, Peter Korsgaard wrote:

>   >> What do we do with our 4.5 based external toolchains and
>   >> BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 (used by directfb)?
>
>   > I think the BR2_TOOLCHAIN_GCC_AT_LEAST_* must be kept for pretty much
>   > all versions of gcc. This symbol is not related to whether we support
>   > that gcc version in our internal toolchain backend or not. Possibly any
>   > gcc version can be used with the external toolchain backend.
>
> True, but we might consider removing preconfigured external toolchains
> using ancient versions if there's sensible newer alternatives available.

Blackfin is 4.5.x so at least this low we must keep.
Regards.
