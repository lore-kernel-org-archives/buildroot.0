From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 21 Dec 2016 20:24:13 +0200
Subject: [Buildroot] [PATCH] libcurl: security bump to 7.52.0
In-Reply-To: <878tr945t3.fsf@dell.be.48ers.dk>
References: <20161221074849.22907-1-peter@korsgaard.com>
 <878tr945t3.fsf@dell.be.48ers.dk>
Message-ID: <20161221182413.xgu3fuavrcscrhum@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Wed, Dec 21, 2016 at 05:15:20PM +0100, Peter Korsgaard wrote:
> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
>  > Fixes CVE-2016-9586 - printf floating point buffer overflow
>  > For details, see:
>  > https://curl.haxx.se/docs/adv_20161221A.html
> 
>  > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> 
> Committed, thanks.

Not in master as of be1a3a3e46 (gcc: bump 6.x series to version 6.3.0).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
