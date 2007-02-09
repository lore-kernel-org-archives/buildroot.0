From: Alexander Rigbo <alexander.rigbo@acgnystrom.se>
Date: Fri, 9 Feb 2007 07:32:55 +0100
Subject: [Buildroot] Buildroot: Problem locating crt1.o on target system.
In-Reply-To: <200702081138.38218.hwstar@rodgers.sdcoxmail.com>
References: <200702081138.38218.hwstar@rodgers.sdcoxmail.com>
Message-ID: <200702090732.55625.alexander.rigbo@acgnystrom.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Any special reason why you choose gcc 3.4.2 over 4.1.1? If not, then i suggest 
you try gcc 4.1.1 instead.

Best Regards
Alexander Rigbo

On Thursday 08 February 2007 20.38.38 Steve Rodgers wrote:
> I've been using buildroot for quite some time and recently decided to
> upgrade it as some of the packages in the older version I'm using are no
> longer available for download.
>
> I've run into a problem using the C compiler and linker on the target
> system. I can't compile a simple "hello world" program written in C on the
> target system.
>
> The compiler/linker complains it can't find crt1.o, even though it is
> located in /user/lib. The exact error message is:
>
> ?/usr/bin/ld: crt1.o: No such file: No such file or directory
>
> I configured buildroot for gcc 3.4.2 and binutils 2.16. I selected the the
> 2.4.31 kernel headers.
>
> The system in question ?was built using the 2/6/07 snapshot tarball of
> buildroot.
>
> The config file for buildroot is attached.
>
> Is there some configuration option I missed?
>
> TIA Steve.
