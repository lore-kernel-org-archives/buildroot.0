From: Alexander (Sasha) Sirotkin <buildroot@browserseal.com>
Date: Wed, 28 Apr 2010 15:24:58 +0300
Subject: [Buildroot] ARM default configuration
In-Reply-To: <6053D9B413B89B4B8F9BE37E4B6F594702FB5473@nwap-auck-ex2.NW.local>
References: <t2n478c82f01004270125q2970af56odc45550d676618d8@mail.gmail.com>
	<6053D9B413B89B4B8F9BE37E4B6F594702FB5473@nwap-auck-ex2.NW.local>
Message-ID: <q2z478c82f01004280524p8e938cd3o809611d38b31babb@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 28, 2010 at 1:39 AM, Rob Alley <Rob.Alley@navmanwireless.com>wrote:

> > What ARM default configurations are supposed to work ? I tried a few,
> including  integrator926_defconfig, but none of them compiled.
> > Or maybe I do not understand the idea of default configuration. Isn't
> it supposed to compile without errors and without asking the user for
> input ?
>
> I believe they are all **supposed** to work.  The at91sam9260 and
> at91sam9g20 defconfigs work for me.  You may still be prompted for user
> inputs the first time - buildroot is constantly being updated but the
> default configs get left behind, this results in prompting for new
> packages etc.
>
>
 at91sam9260dfc_defconfig fails with the following error:
/home/sashas/buildroot-2010.02/output/staging/usr/bin/arm-linux-uclibc-ld:
error
:
/home/sashas/buildroot-2010.02/output/staging/usr/bin-ccache/../lib/gcc/arm-li
nux-uclibc/4.3.4/libgcc.a(_ashrdi3.o) uses hardware FP, whereas u-boot uses
soft
ware FP


> Rob.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100428/ac9926b4/attachment.htm>
