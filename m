From: trem <tremyfr@yahoo.fr>
Date: Sun, 28 Nov 2010 21:07:06 +0100
Subject: [Buildroot] buildroot and sh4
In-Reply-To: <20101115232620.201bba02@surf>
References: <212181.52672.qm@web23104.mail.ird.yahoo.com>	<297538.71443.qm@web29501.mail.ird.yahoo.com>	<20101107192810.2643ce33@surf>	<AB12B32E73474741A2C5361C433A44DE024DB430@rte-ben-exch.RTE.ADWIN.RENESAS.COM>	<4CE05DFF.9050906@yahoo.fr>
	<20101115232620.201bba02@surf>
Message-ID: <4CF2B66A.8010003@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/15/2010 11:26 PM, Thomas Petazzoni wrote:
> On Sun, 14 Nov 2010 23:09:03 +0100
> trem<tremyfr@yahoo.fr>  wrote:
>
>    
>> I've done a new version of the patch based on branch boards-cleanup
>> of git://git.busybox.net/~tpetazzoni/git/buildroot
>>
>> This new patch could be find here :
>> http://ryu.zarb.org/~trem/buildroot/0002-Add-a-qemu-device-target-sh4-r2d.patch
>>      
> This patch does not follow completely the "new" way of adding board
> support in Buildroot:
>
>   * The kernel configuration file should have been saved using "make
>     savedefconfig" in your kernel directory, so as to have a minimal
>     defconfig instead of this huge defconfig.
>
>   * Similarly, the Buildroot configuration file should have been saved
>     using "make savedefconfig" in your Buildroot directory.
>
> With this, instead of having several tens of kilobytes of configuration
> files, you'll have only a few hundred bytes of configuration.
>
> Thanks !
>
> Thomas
>    
Hi

I've done a new version of the patch based on 
git://git.busybox.net/~tpetazzoni/git/buildroot
branch remotes/origin/for-2011.02/boards-cleanup.

The buildroot config and the kernel config use a defconf, so it's very 
small.

This patch could be found here : http://ryu.zarb.org/~trem/buildroot/

regards,
Philippe
