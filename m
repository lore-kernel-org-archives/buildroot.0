From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Wed, 27 Jan 2021 07:33:42 +0300
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: Fix build with
 Postgresql 13
In-Reply-To: <20210126190043.GF2325@scaer>
References: <20210125074058.786498-1-fido_max@inbox.ru>
 <20210126190043.GF2325@scaer>
Message-ID: <7742c301-6192-fc3e-2ebf-19bf6b44a190@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

26.01.2021 22:00, Yann E. MORIN wrote:
> Maxim, All,
> 
> On 2021-01-25 10:40 +0300, Maxim Kochetkov via buildroot spake thusly:
>> Add missed patch for PG13 build.
>>
>> Fixes: 5cff0c8a2d1c ("package/timescaledb: bump to version 2.0.0")
> 
> Does that fix build failures like that:
> 
>      http://autobuild.buildroot.org/results/480/480da8c6a13cc44f5ede9f754a4dfef8800d8e2a/build-end.log
>      http://autobuild.buildroot.org/results/0e5/0e534ed0a5206856fad7272008b12205811f098a/build-end.log
> 
> Or any of the other autobuild failures:
> 
>      http://autobuild.buildroot.org/?reason=timescaledb-%

Yes it is.

> 
> If so, then you can add such references in the commit log:
> 
>      Fixes:
>          http://autobuild.buildroot.org/results/0e5/0e534ed0a5206856fad7272008b12205811f098a/build-end.log

Ok. I will do next time.

> 
> No need to resend this patch just for that, I can add those when
> aplying if need be.
> 

That wold be great!
