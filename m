From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 10 Feb 2012 16:10:05 +0100
Subject: [Buildroot] [PATCH] new program: usb_modeswitch_data
 Signed-off-by: J.C. Woltz <jwoltz@gmail.com>
In-Reply-To: <CAC78GpddeD1eaXkB+QBYvMbxat0YfJyJo0248G5rPg=6oZsKiA@mail.gmail.com>
References: <1328831497-18455-1-git-send-email-jwoltz@gmail.com>
 <CAAXf6LUeHr4tVnpKHCeHvfTJnO2jdJT=2_O40TLnY_s533S7Jg@mail.gmail.com>
 <CAC78GpdRuVrqsF5n0Xn5MTBJ7vSPDua1rAAwur5tpdxyfwfrFw@mail.gmail.com>
 <CAAXf6LXHDCgVzp+OpHN8BTsdx2X418ABum=PZS172F4dGktiSA@mail.gmail.com>
 <CAC78GpddeD1eaXkB+QBYvMbxat0YfJyJo0248G5rPg=6oZsKiA@mail.gmail.com>
Message-ID: <4F35334D.8030404@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 10.02.2012 16:02, schrieb J.C. Woltz:
> 
>     I suggest you send it again after fixing my comments. Maybe other
>     people have further comments.
> 
>     By the way, you may be interested in using a version control system
>     like git or mercurial for managing your buildroot developments. This
>     will make it easier to generate and mail patches.
> 
>     Best regards,
>     Thomas
> 
> 
> Thomas (or anyone else),
> 
> I am using git, but the from line is still in my patch. How do I remove it? Below are the commands I am using:
> git add package/Config.in
> git add package/usb_modeswitch_data/
> git commit -s

try "git commit --amend" and delete everything you don't need

> git format-patch --subject-prefix="PATCH v2" origin
