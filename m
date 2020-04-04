From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat, 4 Apr 2020 08:57:58 +0200
Subject: [Buildroot] [Question] How do I build source code at source
 folder?
In-Reply-To: <CAF6vTZZctgOOnqcseZ5-UVGQbg2baC8Le4qazOZ2rFpdH_3tcw@mail.gmail.com>
References: <1585904837068-0.post@n4.nabble.com>
 <CAEyMn7bt=wUY=RLDSE=QAD8F+ap5K4rRaB12Rs1SgjmOSeN_CQ@mail.gmail.com>
 <CAF6vTZZctgOOnqcseZ5-UVGQbg2baC8Le4qazOZ2rFpdH_3tcw@mail.gmail.com>
Message-ID: <CAEyMn7ZJ1DUfmncko0ZOhdha9Ec9bN4F3ud=KBYF3yMJAW0g_w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am Sa., 4. Apr. 2020 um 08:52 Uhr schrieb Psychesnet Hsieh
<psychesnet@gmail.com>:
>
> Hi Heiko,
>
> Thanks and yes, I know I can use _OVERRIDE_SRCDIR to define local folder as source.
> But what I need is directly build source code at source folder without copy/rsync.
> And eventually the target object will install into output/fakeroot folder.
> Do you have any idea to get it done? Thanks.

I don't understand why you need to build in the source directory. Can
you give some more background information about that?

-- 
Heiko
