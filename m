From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Sat, 02 May 2020 12:39:33 +0200
Subject: [Buildroot] [PATCH] package/python-xmodem: new package
In-Reply-To: <CALFsTFW=hMQH1sYJEDNPg_=QGeh9iRkMF+m5myR2BE1pv4oGrw@mail.gmail.com>
References: <20200430132020.2476465-1-m.niestroj@grinn-global.com>
 <87d07p85mm.fsf@grinn-global.com>
 <CALFsTFW=hMQH1sYJEDNPg_=QGeh9iRkMF+m5myR2BE1pv4oGrw@mail.gmail.com>
Message-ID: <87tv0y62oq.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Asaf,

Asaf Kahlon <asafka7@gmail.com> writes:

> Hello,
>
> On Thu, Apr 30, 2020 at 4:28 PM Marcin Niestr?j
> <m.niestroj@grinn-global.com> wrote:
>>
>> Hi All!
>>
>> The problem with this package is that there is no license file when we
>> download from pypi. But there is one on github. Question is: what should
>> we do about it?
>
> We already have some python packages which don't include the license
> on the tarball, although it exists in the repo.
> Most of the times, it's because the maintainer of the package didn't add
> the license file in MANIFEST.in (which seems to be your case too).
> On those cases, PKG-INFO is mostly used, but it's not the preferred
> solution, so I suggest to send a PR for adding the license to
> MANIFEST.in
> You can see an example from snmpclitools here:
> https://github.com/etingof/snmpclitools/commit/d93597050f7e4708ce875cc47274c39a9e63da11

Thanks for hints! If it takes reasonable time to merge, then I will post
v2 with LICENSE. If not, then I will try PKG-INFO for the time before
next package release.

-- 
Regards,
Marcin Niestr?j
