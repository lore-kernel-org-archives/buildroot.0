From: Norbert Lange <nolange79@gmail.com>
Date: Thu, 28 Mar 2019 16:23:52 +0100
Subject: [Buildroot] [PATCH 1/1] package/liburcu: bump version to 0.10.2
In-Reply-To: <87pnqbmitt.fsf@dell.be.48ers.dk>
References: <20190325215102.20059-1-nolange79@gmail.com>
 <87pnqbmitt.fsf@dell.be.48ers.dk>
Message-ID: <CADYdroNt7C4Mbm3+vyMLZHbd01aBCtEmmihrcU0-Lm13NYHxXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Do., 28. M?rz 2019 um 10:47 Uhr schrieb Peter Korsgaard
<peter@korsgaard.com>:
>
> >>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:
>
>  > From: Norbert Lange <norbert.lange@andritz.com>
>  > This includes a fix that might delay application startup
>  > considerably (11486a15008b9).
>
> Presumably you mean a this fixes an issue which caused delayed
> application startup?

Yes, sorry

> Should this be applied to 2019.02.x as well?

Its a new version, I dont know what versioning scheme you follow,
but that's more than a a small bugfix to me?

Practically if you use lttng-ust your application could block for a
while. The fix is in 0.10.1
aswell as in 0.9.5, see
https://github.com/urcu/userspace-rcu/commit/64478021edcf7a5ac3bca3fa9e8b8108d2fbb9b6

Norbert
