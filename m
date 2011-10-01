From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 2 Oct 2011 00:35:03 +0200
Subject: [Buildroot] [PATCH] gdb: bump to 7.3.1
In-Reply-To: <201110012324.54139.arnout@mind.be>
References: <4E856673.8020205@visionsystems.de> <20110930222606.2ed76af5@skate>
 <201110012324.54139.arnout@mind.be>
Message-ID: <CAGm1_ktCdcObbXCYQryUOU5h=Sxpe+aE598NuLXU4HCQ9jCxrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 1, 2011 at 11:24 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Friday 30 September 2011 22:26:06, Thomas Petazzoni wrote:
>> Yegor,
>>
>> Can you send a patch with a proper description, so that it can be
>> applied with git am ?
>>
>> By proper description I mean :
>>
>> ?* Don't forget that everything before the --- is kept in the commit
>> ? ?log, so don't put "personal" explanations.
>
> ?Actually, you can put "personal" explanations after the ---. ?So the
> following would work:
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> On my old build system (openSUSE 10.3) I had problems compiling GDB saying
> something like my glibc is too old. So I tried the latest version and could
> compile without a problem. See the patch below.

Thanks for comments. I'll rework the patch next week. By the way
shouldn't we get rid of 6.8 due to this issue:
http://comments.gmane.org/gmane.comp.gdb.devel/30648. That was the
reason for trying 7.x version.

Yegor
