From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 12 May 2017 19:47:45 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03-rc2
Message-ID: <767d3192-fcf1-42e2-8eb5-ab6e0020e709@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

12 ??? 2017 ?. 20:15 ???????????? Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ???????:
Hello,

On Fri, 12 May 2017 21:31:04 +0300, Alexey Brodkin wrote:
> This commit bumps ARC toolchain to arc-2017.03-rc2
>
> Please note that it is a release candidate and it might contain some
> breakages, please don't use it for production builds.
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

What should we do in Buildroot master branch? We're currently using
arc-2017.03-rc1, which is also a release candidate. We are planning on
releasing Buildroot at the end of the month.

Should we pick -rc2 instead of -rc1 for this release ? We normally
don't upgrade components after Buildroot has released its -rc1, but I
guess we could make an exception since a release candidate is used for
ARC toolchain components.

Well we plan to cut the final release in coming weeks but not sure if we do it before the end of the month :(

Still this RC2 contains important fixes which we really want to have. Moreover some existing Buildroot failures could be cured by RC2 (still I need to verify all known issues).

Anyways in Buildroot release we'd like to see either final release of Arc told or at least RC3 if it happens.

-Alexey


Best regards,

Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
https://urldefense.proofpoint.com/v2/url?u=http-3A__free-2Delectrons.com&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=dy177ajnNqVA4CYkWXphyVbEsZDTwuZVr71ricsNERI&s=LYifeyOCO5rqYczIcClowzhVZTS6BdGynVJdxRdTIKI&e=

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170512/2284ce73/attachment.html>
