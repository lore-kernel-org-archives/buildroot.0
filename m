From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 28 Nov 2016 06:19:08 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-good: add upstream patches to
 fix security issue in flic decoder
In-Reply-To: <20161127214118.2545-1-peter@korsgaard.com>
References: <20161127214118.2545-1-peter@korsgaard.com>
Message-ID: <20161128041908.eaxfckbxxet3rfhq@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Nov 27, 2016 at 10:41:18PM +0100, Peter Korsgaard wrote:
> As detailed by Chris Evans, the flic decoder contains a buffer overflow which
> can be exploited to cause arbitrary code execution as the user running
> gstreamer:
> 
> https://scarybeastsecurity.blogspot.be/2016/11/0day-exploit-advancing-exploitation.html
> 
> Fixes CVE-2016-963{4,5,6}.

The expanded form of this pattern would be nicer to future 'git log --grep'.

> add the upstream patches to fix this issue.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
