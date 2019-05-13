From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 13 May 2019 13:20:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <20190509230324.0b03746e@windsurf.home>
References: <20190509060042.1026E872A2@whitealder.osuosl.org>
 <20190509230324.0b03746e@windsurf.home>
Message-ID: <8fd5700b-d81b-71da-7edb-c32248a32a4f@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thomas,

On 09/05/2019 23:03, Thomas Petazzoni wrote:
> Hello,
>
> -rc1 has been released, let's try to resume my traditional effort of
> analyzing the build failures, and bring attention to some of them.
>
> Julien, Louis-Paul, Nylon, Romain, Vadim, Adam, Peter, Bernd, please
> see below: there are some questions for you! :-)
>
... cut ...
>
>>       xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4f460ff42739e3c8277baf50880139aefd169cfa |     
> We still have this regular timeout, almost always on Julien Boibessot's
> machine. Julien, do you have any idea what's going on ?

I have already brought this problem up a few times before but no one has
a clue.
My build system is consuming 100% CPU in conftest process when building
libsodium.

In this state I have to manually kill all conftest processes otherwise
the build is blocked for days... :-)

Best regards,
Julien
