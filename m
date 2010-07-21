From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 21 Jul 2010 11:51:35 -0300
Subject: [Buildroot] issue with ppp
In-Reply-To: <4C2E50E9.4090305@tiedyenetworks.com>
References: <4C2E50E9.4090305@tiedyenetworks.com>
Message-ID: <4C470977.2060809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/02/2010 05:49 PM, mike wrote:

> Hi,
> 
>   In my buildroot, I'd already bumped to 2.4.5 and fixed a number of
> things. Radiusclient files aren't being installed by the buildroot
> makefile and it's also missing 1 plug in, radrealms, which my version
> does handle now. Not to be a total dweeb but what would be the best way
> to merge and submit some of these fixes to buildroot without corrupting
> my local tree?
> 
> Mike-

Hi.
Sorry i didn't look into this sooner, was a bit busy with other things.
Give my patch a try, it will (hopefully) install all the radius plugins
and configuration files when enabled by the new configuration option.
It also converts the package to gentargets infrastructure since it's
really not autotargets.
Usually the best way to get patches merged is to send them to the
mailing list or the bug tracker. If they are correct and work they'll
usually get incorporated for the next release time permitting so.
Regards.
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot-pppd-radius.patch
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100721/667c30fe/attachment.ksh>
