From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 30 Jun 2017 14:18:23 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-06-29
In-Reply-To: <20170630063058.3F17621D36@mail.free-electrons.com>
References: <20170630063058.3F17621D36@mail.free-electrons.com>
Message-ID: <20170630111823.qnevm75qccjidppl@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, Jun 30, 2017 at 08:30:58AM +0200, Thomas Petazzoni wrote:
>          arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/691d61d13849150c3616b1c74c964f50118ff1d9 |     
>          arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/2918c75e473c5a2434e72f2e409becc5b4d07908 |     
>          arm | dropwatch-7c33d8a8ed105b07a... | NOK | http://autobuild.buildroot.net/results/9be9c30f9859bd896de358a5cb900355257990b0 |     

It only fails on your gcc20 machine. Can't reproduce this one here. Looks like 
the incdefs.sh script fails to detect clock_adjtime(), even though it detects 
posix_spawn() correctly.

Can you take a look?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
