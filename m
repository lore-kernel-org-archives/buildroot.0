From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 25 Aug 2012 03:20:57 +0300
Subject: [Buildroot] [PATCH] freetype, libfuse, libpng, x11vnc,
 zlib: get rid of BR2_SOURCEFORGE_MIRROR
In-Reply-To: <20120824233420.296862c5@skate>
References: <1345673515-1719-1-git-send-email-stefan.froberg@petroprogram.com>
 <1345673515-1719-2-git-send-email-stefan.froberg@petroprogram.com>
 <20120824233420.296862c5@skate>
Message-ID: <50381A69.6040909@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

25.8.2012 0:34, Thomas Petazzoni kirjoitti:
> Le Thu, 23 Aug 2012 01:11:55 +0300,
> Stefan Froberg <stefan.froberg@petroprogram.com> a ?crit :
>
>> Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
>> ---
>>  package/freetype/freetype.mk |    2 +-
>>  package/libfuse/libfuse.mk   |    2 +-
>>  package/libpng/libpng.mk     |    2 +-
>>  package/x11vnc/x11vnc.mk     |    2 +-
>>  package/zlib/zlib.mk         |    2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
> Applied, thanks.
>
> I have done one small change: use $() everywhere instead of the ${}
> that you introduced. We use $() everywhere in Buildroot to reference
> make variables.
>
> Could you look at the other packages that reference the
> BR2_SOURCEFORGE_MIRROR variable?
Sure, no problem.
I will make one megapatch that takes care of all the rest of the
sourceforge packages.

Actually I think I do just that before submitting my cleaned up firefox
patch + it's required changes
to other packages as you requested.
http://lists.busybox.net/pipermail/buildroot/2012-August/057858.html

Stefan

> Thanks!
>
> Thomas
