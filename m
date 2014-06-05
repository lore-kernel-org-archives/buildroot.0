From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jun 2014 15:44:39 +0300
Subject: [Buildroot] [PATCHv2] wpa_supplicant: bump to version 2.2
In-Reply-To: <1401971649-21728-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401971649-21728-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140605124439.GO4193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Jun 05, 2014 at 09:34:09AM -0300, Gustavo Zacarias wrote:
> Patches are now upstream.
> 
> Enable epoll support since any modern kernel/toolchain supports it.
> 
> Interworking requires Hotspot functionality which we didn't enable
> before so introduce a new option for them.
> 
> While at it group and sort the options in a more lean and friendly way.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
