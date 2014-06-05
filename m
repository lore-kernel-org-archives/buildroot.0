From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jun 2014 14:36:14 +0300
Subject: [Buildroot] [PATCH] hostapd: bump to version 2.2
In-Reply-To: <53905538.2020907@zacarias.com.ar>
References: <a2d2ff5ac6c66d5ee3369224d818db5b5869c475.1401963749.git.baruch@tkos.co.il>
 <53905538.2020907@zacarias.com.ar>
Message-ID: <20140605113614.GM4193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Thu, Jun 05, 2014 at 08:32:08AM -0300, Gustavo Zacarias wrote:
> On 06/05/2014 07:22 AM, Baruch Siach wrote:
> 
> > Drop upstream patch.
> 
> You can also drop the CONFIG_IEEE80211W setting since it's now default y
> and redundant.

Thanks for reviewing. Will do in v2.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
