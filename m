From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 23:15:34 +0100
Subject: [Buildroot] [PATCH] Run post scripts referenced by relative
 paths
In-Reply-To: <CAHKzcEN7NvA9XAiFEAZ9xpjp16YQYzNX2sucbmQ4ps_yRZrScA@mail.gmail.com>
References: <1390904090-27934-1-git-send-email-waldemar.rymarkiewicz@gmail.com>
 <CAGduivzPCzuKsvy2HWuxdv9E5wVzdWvgdosNCBfQsenmmeZihA@mail.gmail.com>
 <CAHKzcEM_-gWUPe_cSYQCoUtgywMwmi8Wkjyy25UqgMGSRQto8A@mail.gmail.com>
 <20140128183202.GC3466@free.fr> <20140128224133.3a145dd0@skate>
 <CAHKzcEN7NvA9XAiFEAZ9xpjp16YQYzNX2sucbmQ4ps_yRZrScA@mail.gmail.com>
Message-ID: <20140128231534.42dbd2e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Rymarkiewicz,

On Tue, 28 Jan 2014 23:06:05 +0100, Waldemar Rymarkiewicz wrote:

> The point was that neither manual nor menuconfig help explains how a
> script should be referenced. By full path, relative or what. In my
> case the easiest way was  just to put  "a space-separated list of
> scripts" as per help message and it does not work. For someone who is
> not dealing with buildroot frequently it can be an issue. Of course
> you can always use ./your_script, but still it's not explained
> anywhere. Abspath will fix it and it costs nothing, but I understand
> your way of thinking.

Your patches to the documentation and/or the help text of the
problematic Config.in options would definitely be welcome!

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
