From: Jeroen Roovers <jer@airfi.aero>
Date: Thu, 3 Nov 2016 12:28:57 +0100
Subject: [Buildroot] [PATCH 0/2] libcurl: Incorrect fix for CVE-2016-8625
In-Reply-To: <20161103111947.s3t4ucbnmj2ngx7y@tarshish>
References: <20161103110512.13676-1-jer@airfi.aero>
 <20161103111947.s3t4ucbnmj2ngx7y@tarshish>
Message-ID: <CANCHnQoO8jFZpRDFd3ER1xwAhVb4d=_omLpyza6=wOQY7-d4vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3 November 2016 at 12:19, Baruch Siach <baruch@tkos.co.il> wrote:
> I could not find any mention of libidn2 in the CVE-2016-8625 advisor at
> https://curl.haxx.se/docs/adv_20161102K.html .

Indeed. The commit that switched to libidn2 does mention the advisory.

https://github.com/curl/curl/commit/9c91ec778104ae3b744b39444d544e82d5ee9ece


Regards,
     jer
