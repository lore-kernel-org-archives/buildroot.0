From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 13 May 2019 17:59:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-08
In-Reply-To: <20190513133146.7a011b13@windsurf.home>
References: <20190509060042.1026E872A2@whitealder.osuosl.org>
 <20190509230324.0b03746e@windsurf.home>
 <8fd5700b-d81b-71da-7edb-c32248a32a4f@free.fr>
 <20190513133146.7a011b13@windsurf.home>
Message-ID: <a40a22a6-6b2b-0c03-95ed-78fd0461428d@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 13/05/2019 13:31, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 13 May 2019 13:20:54 +0200
> Julien Boibessot <julien.boibessot@free.fr> wrote:
>
>> I have already brought this problem up a few times before but no one has
>> a clue.
>> My build system is consuming 100% CPU in conftest process when building
>> libsodium.
>>
>> In this state I have to manually kill all conftest processes otherwise
>> the build is blocked for days... :-)
> Which configure test is it running when it's blocked ? 

when host-libsodium fails I would say it is blocked on:

    /checking whether segmentation violations can be caught when using
the C compiler.../


> What does
> "strace" says about this conftest process that is stuck ?
>
> Can  you reproduce manually ? Does it happen every time libsodium is
> built on your machine, or only once in a while ?

It sometimes can be reproduced manually but not as often as from BR
build system.
I would say when it fails from BR build, I can kill it and reproduce the
problem once.

Most of the time it works well when build manually.

Best regards,
Julien
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190513/d9ebed49/attachment.html>
