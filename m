From: Spenser Gilliland <spenser@gillilanding.com>
Date: Tue, 28 May 2013 09:02:56 -0500
Subject: [Buildroot] [PATCH 1/1] attr: bump to version 2.4.47
In-Reply-To: <20130528130703.694786e2@skate>
References: <1369738614-31476-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20130528130703.694786e2@skate>
Message-ID: <CAEBucnA0ZwDr35-9wr7jA3Gu-6pR_xpy6iXQo_EqGCnKdE4aZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, May 28, 2013 at 6:07 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Jerzy Grzegorek,
>
> On Tue, 28 May 2013 12:56:54 +0200, Jerzy Grzegorek wrote:
>> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
>> ---
>>  ...r-0001-attr-Fix-static-build-installation.patch |   30 --------------------
>
> Can you confirm that this patch has been integrated in the new upstream
> version?
>
> Generally speaking, when bumping to a new upstream version involves
> removing/adding patches, it would be nice to have a slightly more
> detailed commit log that explains why patches are added/removed.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thomas,

I investigated this issue a while ago for fun and I don't think that
patch ever worked.  Many (maybe all) of the autobuild failures on acl
were because there was no static library of attr to link against.

Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
