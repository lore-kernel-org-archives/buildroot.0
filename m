From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 12 Jul 2017 07:37:02 +0300
Subject: [Buildroot] [PATCH v2] python-systemd: add new package
In-Reply-To: <20170712024121.2564-1-andrew.smirnov@gmail.com>
References: <20170712024121.2564-1-andrew.smirnov@gmail.com>
Message-ID: <20170712043701.frfvmmnf535ukcjk@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,

On Tue, Jul 11, 2017 at 07:41:21PM -0700, Andrey Smirnov wrote:
> Add package for official python bindings availibe as a part of systemd
> project at: https://github.com/systemd/python-systemd
> 
> Minimal config snippet for utils/test-pkg is as follows (sans
> backslashes):
> 
> \# BR2_INIT_BUSYBOX is not set
> \# BR2_INIT_SYSV is not set

You can use the --cleanup=whitespace parameter of the 'git commit' command to 
skip the removal of lines starting with '#'. That would make config fragments 
look nicer.

> BR2_INIT_SYSTEMD=y
> \# BR2_INIT_NONE is not set
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_SYSTEMD=y

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
