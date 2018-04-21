From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 22 Apr 2018 00:09:40 +0300
Subject: [Buildroot] [PATCH v2 1/1] reaver: add missing dependency on
 non static lib.
In-Reply-To: <1524248835-4552-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1524248835-4552-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180421210940.dnnaqvoh25ld3wpx@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Guillaume,

On Fri, Apr 20, 2018 at 08:27:15PM +0200, Guillaume W. Bres wrote:
> Fixes 
> 
> 	http://autobuild.buildroot.net/results/0fb387f0544e962e5080ea966864f325fbaf4117
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> ---
> 
> v2: static libs are now allowed. I used Arnout's suggestion
> which caused ./configure to pass. Then there was a linker problem
> that was solved by using the trick on LDFLAGS this time. Build now passes.

The patch title is wrong now. Should be something like "fix static build".

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
