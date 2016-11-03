From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 Nov 2016 14:02:49 +0200
Subject: [Buildroot] [PATCH 0/2] libcurl: Incorrect fix for CVE-2016-8625
In-Reply-To: <CANCHnQoO8jFZpRDFd3ER1xwAhVb4d=_omLpyza6=wOQY7-d4vQ@mail.gmail.com>
References: <20161103110512.13676-1-jer@airfi.aero>
 <20161103111947.s3t4ucbnmj2ngx7y@tarshish>
 <CANCHnQoO8jFZpRDFd3ER1xwAhVb4d=_omLpyza6=wOQY7-d4vQ@mail.gmail.com>
Message-ID: <20161103120249.zwe5t5jseuzrfha7@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Thu, Nov 03, 2016 at 12:28:57PM +0100, Jeroen Roovers wrote:
> On 3 November 2016 at 12:19, Baruch Siach <baruch@tkos.co.il> wrote:
> > I could not find any mention of libidn2 in the CVE-2016-8625 advisor at
> > https://curl.haxx.se/docs/adv_20161102K.html .
> 
> Indeed. The commit that switched to libidn2 does mention the advisory.
> 
> https://github.com/curl/curl/commit/9c91ec778104ae3b744b39444d544e82d5ee9ece

Please mention that in the libidn to libidn2 commit log.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
