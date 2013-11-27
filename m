From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 27 Nov 2013 07:06:41 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/mips64-malta: switch to eglibc
In-Reply-To: <20131127092443.0c6ea9b9@skate>
References: <1385513501-23157-1-git-send-email-gustavo@zacarias.com.ar>	<1385513501-23157-2-git-send-email-gustavo@zacarias.com.ar>
 <20131127092443.0c6ea9b9@skate>
Message-ID: <5295C431.2010807@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/27/2013 05:24 AM, Thomas Petazzoni wrote:

> I think the broken dynamic loader for mips64 in uClibc is now fixed by
> package/uclibc/0.9.33.2/uclibc-0009-mips64-fix-n64-interp.patch.

Probably, but besides that it's generally unstable with uClibc (you
almost certainly can't login properly) where with eglibc it just works(tm).
Though maybe it just needs a little kick like the recent SIGBUS mips64
patch from the uclibc mailing list.
Regards.
