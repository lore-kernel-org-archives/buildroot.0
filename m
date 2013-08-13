From: Reuben Dowle <reuben.dowle@4rf.com>
Date: Tue, 13 Aug 2013 22:15:34 +0000
Subject: [Buildroot] [PATCH] package: add the duma memory debugging
 library
In-Reply-To: <20130813225918.5f27ce9b@skate>
References: <069B5A25F9844945B625ADE7258AC94C061E77EA@4rf-nz-orion.local.4rf.com>
 <20130813225918.5f27ce9b@skate>
Message-ID: <069B5A25F9844945B625ADE7258AC94C064D8477@4rf-nz-orion.local.4rf.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To get duma compiling I just copied the patches that crosstool-ng was using verbatim. My toolchain supports c++, so this is not of any interest to me.

Thanks,
Reuben

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Wednesday, 14 August 2013 8:59 a.m.
> To: Reuben Dowle
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH] package: add the duma memory debugging
> library
>
> Dear Reuben Dowle,
>
> On Thu, 14 Feb 2013 23:05:53 +0000, Reuben Dowle wrote:
> > Add the duma memory debugging library. This is based on an earlier
> patch by
> > Baruch Siach, with minor changes to build for latest buildroot
> sources.
> >
> > Signed-off-by: Reuben Dowle <reuben.dowle@4rf.com>
>
> Applied, thanks. Note that I have dropped the no-C++ support, because
> it wasn't building here, and I thought it wasn't worth the effort.
>
> If you're really interested in the no-C++ support, feel free to revive
> this part of the patch, make it work, and resubmit it.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
The information in this email communication (inclusive of attachments) is confidential to 4RF Limited and the intended recipient(s). If you are not the intended recipient(s), please note that any use, disclosure, distribution or copying of this information or any part thereof is strictly prohibited and that the author accepts no liability for the consequences of any action taken on the basis of the information provided. If you have received this email in error, please notify the sender immediately by return email and then delete all instances of this email from your system. 4RF Limited will not accept responsibility for any consequences associated with the use of this email (including, but not limited to, damages sustained as a result of any viruses and/or any action or lack of action taken in reliance on it).
