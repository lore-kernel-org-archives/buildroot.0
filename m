From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Apr 2016 13:14:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/kodi: not available using a
 musl-based toolchain
References: <1453848286-2477-1-git-send-email-bernd.kuhls@t-online.de>
 <20160127092255.75c83958@free-electrons.com>
 <48lnncxqr3.ln2@ID-313208.user.individual.net>
 <20160127213046.34c7cee3@free-electrons.com>
Message-ID: <ndmuucxj3a.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 27 Jan 2016 21:30:46 +0100 schrieb Thomas Petazzoni:

>> > And what happens if you add an additional case to support musl ?
>> 
>> Hi Thomas,
>> 
>> the build will fail:
[...]
>> 
>> I know these problems are fixable and the voidlinux projects seems to
>> have done it already for 15.2-Isengard:
>> https://github.com/voidlinux/void-
>> packages/tree/99f74705bc6520297d689fae4bcc9606c71ad34f/srcpkgs/kodi/
>> patches
>> 
[...]
> 
> Thanks for the explanation. Ideally, this should have been part of the
> commit log from the beginning, so that we keep in the git history the
> real reason for disabling Kodi on musl.

Hi Thomas,

with my latest PR I started the process to add musl support to Kodi:
https://github.com/xbmc/xbmc/pull/9672

I am curious for the reaction from upstream ;)

Regards, Bernd
