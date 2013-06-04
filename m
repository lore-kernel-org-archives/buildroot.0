From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Jun 2013 10:09:47 +0200
Subject: [Buildroot] [PATCH 2/6] package/linux-firmware: bump version
	for new firmware
In-Reply-To: <87k3maficu.fsf@dell.be.48ers.dk>
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <20130604091305.6fdc8fdc@skate> <87k3maficu.fsf@dell.be.48ers.dk>
Message-ID: <201306041009.47767.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Peter, All,

On Tuesday 04 June 2013 09:25:05 Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  Thomas> Dear Yann E. MORIN,
>  Thomas> On Mon,  3 Jun 2013 22:15:48 +0200, Yann E. MORIN wrote:
> 
>  >> -config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
>  >> -	bool "Realtek 8192"
>  >> +config BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
>  >> +	bool "Realtek 81xx"
>  >> help
>  >> -	  Realtek 8192
>  >> +	  Realtek 8188/8192
>  >> 
>  >> -config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
>  >> -	bool "Realtek 8712"
>  >> +config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
>  >> +	bool "Realtek 87xx"
>  >> help
>  >> -	  Realtek 8712
>  >> +	  Realtek 8712/8723
> 
>  Thomas> Warning, warning, warning: renaming of Kconfig options without
>  Thomas> Config.in.legacy updates!

Gahhh... :-(
I even thought about it at the time, and just forgot... :-(

>  Thomas> I must say I'm proud to be the one who mentions that, even after Peter
>  Thomas> reviewed and committed the patch :-)
> 
> Gaah, I even thought about it when I saw it, but then forgot about it
> again.
> 
> Yann, will you send a patch adding Config.in.legacy handling for the old
> names?

Yes, this evening, when back at home.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
