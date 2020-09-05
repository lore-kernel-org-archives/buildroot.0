From: Alexander Egorenkov <egorenar-dev@posteo.net>
Date: Sat, 05 Sep 2020 21:41:09 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/makedumpfile: new package
In-Reply-To: <20200905212209.1e476db9@windsurf.home>
References: <20200831111226.15764-1-egorenar-dev@posteo.net>
 <20200903232648.6be84338@windsurf.home> <87y2louth0.fsf@posteo.net>
 <87v9gsus6t.fsf@posteo.net> <20200905212209.1e476db9@windsurf.home>
Message-ID: <87mu24ui3u.fsf@posteo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Indeed, I hadn't noticed that glibc and musl define PN_XNUM, but not
> uClibc. Good catch.
>
> I guess the simplest then is to do what OpenSuse is doing:
> https://build.opensuse.org/package/view_file/Kernel:kdump/makedumpfile/makedumpfile-PN_XNUM.patch?expand=1.
> I had already seen it, found it not a great solution, but it's indeed
> the simplest.

Yeah, i also saw that patch.
Added.

Sending the next version of the package.

Thanks for feedback
Regards
Alex
