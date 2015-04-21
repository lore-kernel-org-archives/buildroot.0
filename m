From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 18:36:10 +0200
Subject: [Buildroot] Reminder about your pending Buildroot patches
In-Reply-To: <20150421124317.BA6BE88D@mail.free-electrons.com>
References: <20150421124317.BA6BE88D@mail.free-electrons.com>
Message-ID: <20150421163610.GA4262@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-21 14:43 +0200, Thomas Petazzoni spake thusly:
> This is a reminder about your Buildroot patches that are older than 30
> days.
> 
> We need your help to know if your patches are still relevant or not.
> To help us, make sure to update the status of your patches in
> patchwork as appropriate, or to resend an updated version that applies
> on the latest Buildroot master. Especially let us know if you would
> like to withdraw your patch if you are no longer interested.
> 
> Here is the list of patches you have submitted that are still pending:
> 
>  - [1/8,v8] package/xserver_xorg-server: prepare for multiple supported versions
>    http://patchwork.ozlabs.org/patch/450221/
> 
>  - [2/8,v8] package/xserver_xorg-server: make the version a choice
>    http://patchwork.ozlabs.org/patch/450222/
> 
>  - [3/8,v8] package/xserver_xorg-server: add blind options to specify driver ABI
>    http://patchwork.ozlabs.org/patch/450223/
> 
>  - [4/8,v8] package/xserver_xorg-server: not all versions need all dependencies
>    http://patchwork.ozlabs.org/patch/450225/
> 
>  - [5/8,v8] package/xserver_xorg-server: add version 1.14.7
>    http://patchwork.ozlabs.org/patch/450224/
> 
>  - [6/8,v8] package/nvidia-tegra23-binaries: new package
>    http://patchwork.ozlabs.org/patch/450226/
> 
>  - [7/8,v8] package.nvidia-tegra23-binaries: add gstreamer plugins
>    http://patchwork.ozlabs.org/patch/450228/
> 
>  - [8/8,v8] package/nvidia-tegra23-codecs: new package
>    http://patchwork.ozlabs.org/patch/450227/

Still valid inmy point of view.

Anyone can test this up to and including patch 5, as this does not
require access to specific hardware.

As for patches 6-8, anyone with access to a tegra2/3 system should test
it, as I do not have access to such a system.

>  - [2/2,v3] toolchain: fix installing gconv libs with multi-arch toolchain
>    http://patchwork.ozlabs.org/patch/451014/

Still applicable. I will rebase and resend shortly.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
