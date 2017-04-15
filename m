From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Apr 2017 01:31:13 +0300
Subject: [Buildroot] [PATCH 1/1] rtl8821au: bump to latest
In-Reply-To: <20170415173320.14802-1-christian@paral.in>
References: <20170415173320.14802-1-christian@paral.in>
Message-ID: <20170415223113.oyb2er4kmth7bq5q@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Christian,

On Sat, Apr 15, 2017 at 01:33:20PM -0400, Christian Stewart wrote:
> Two CFLAGS are added: -Wno-unused-function and -Wno-unused-variable.
> 
> These warnings are disabled due to several unused functions and
> variables in the codebase that cause build failures with the
> -Wall -Werror flags enabled in rtl8821au.

A better future proof approach might be disabling -Werror with -Wno-error 
instead.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
