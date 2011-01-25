From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 26 Jan 2011 00:25:13 +0100
Subject: [Buildroot] [git commit master 1/1] Use sys-root rather than
	sysroot for the sysroot/staging_dir
In-Reply-To: <20110125225053.49f7660b@surf>
References: <20110125150944.2C7438D244@busybox.osuosl.org>
	<201101252239.36666.yann.morin.1998@anciens.enib.fr>
	<20110125225053.49f7660b@surf>
Message-ID: <201101260025.13116.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 25 January 2011 22:50:53 Thomas Petazzoni wrote:
> Just for the record, my preference for "sysroot" instead of "sys-root"
> is because all sysroot-related options in gcc use the "sysroot"
> spelling and not "sys-root" :

Yes, agreed. That's the reason I also changed the default in crosstool-NG
to 'sysroot', to match the literature.

The 'sys-root' name comes from the original crosstool:
  http://code.google.com/p/crosstool/source/browse/trunk/src/crosstool.sh#320

I saw no reason to change it at the time, although I hae no strong opinion
about it (so I renamed).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
