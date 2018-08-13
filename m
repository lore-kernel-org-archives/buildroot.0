From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Aug 2018 20:17:05 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/gcc: fix build of
 gcc-7.3.0 with
References: <20180812172909.21450-1-bernd.kuhls@t-online.de>
 <ae19c065-5ce3-a333-173d-388612659cc3@t-online.de>
 <20180812210419.78125b1e@windsurf>
Message-ID: <1iu84fx279.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 12 Aug 2018 21:04:19 +0200 schrieb Thomas Petazzoni:

>> upstream has no patches for these versions:
> 
> Does this mean the problem doesn't exist, or just that the gcc
> developers didn't backport the patch ?

the latter.

> Could you do a test build of gcc 6.x and glibc 2.28 ? Or perhaps verify
> in the source code that the problem didn't exist back then ?

done, all older gcc versions are affected as well, sent patches:

http://patchwork.ozlabs.org/project/buildroot/list/?series=60590

>> > or1k-musl-5.4.0-20170218
>> 
>> Could not find an upstream branch at gcc.gnu.org.
> 
> This is not an official upstream branch, but if the upstream 5.4.0 is
> affected by the issue, the patch should apply just as well to this
> branch.

In buildroot or1k has no support for glibc, only for uclibc and musl.
Therefore I did not patch this gcc version.

Regards, Bernd
