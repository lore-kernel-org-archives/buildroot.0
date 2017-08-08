From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 8 Aug 2017 13:54:39 -0700
Subject: [Buildroot] [uclibc-ng-devel] buildroot uClibc-ng build failure
In-Reply-To: <CAPmKWpEnqQEiUjjjYDkGiwtvGu-4XmCmrK04sbVQzJdCOff-gg@mail.gmail.com>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
 <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
 <CAPmKWpEnqQEiUjjjYDkGiwtvGu-4XmCmrK04sbVQzJdCOff-gg@mail.gmail.com>
Message-ID: <CAMo8Bf+-0C7EVQmAyfDokQwyWWsy5ERaEaJ4oMVNc8=tQ1NTdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 8, 2017 at 12:07 PM, Eugene Yudin <e.yudin@ndmsystems.com> wrote:
> Yes. Please install the locale "en_US.UTF-8".
> It's used in buildroot by default:
> package/uclibc/uclibc.mk:46:UCLIBC_LOCALES = en_US

Just curious: why not defaulting to C (or C.UTF-8) locale?

-- 
Thanks.
-- Max
