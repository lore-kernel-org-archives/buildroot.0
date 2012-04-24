From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <elezegarcia@gmail.com>
Date: Tue, 24 Apr 2012 14:48:31 -0300
Subject: [Buildroot] where to commit a kernel modification?
In-Reply-To: <CAPEB33y5bJi1K=aexVK8m3h_U0_4x+KwamE4mLX6V=Cs2+PA8Q@mail.gmail.com>
References: <CAPEB33z4-PhKHiqw7WZohZ5kph_eieUN7v2QjCJ4SLn==JDOHg@mail.gmail.com>
 <201204211539.42000.arnout@mind.be>
 <CALF0-+WVB6xQDb=hAEij=ocQ0imfw-ZssxHbsJcXBQ53p516sQ@mail.gmail.com>
 <CAPEB33y5bJi1K=aexVK8m3h_U0_4x+KwamE4mLX6V=Cs2+PA8Q@mail.gmail.com>
Message-ID: <CALF0-+VF0a029edp_A_aNZD+=FfBco4e6s-kbexfjAwHp8U98A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johann,

2012/4/24 MERCADIER Johann <johann.mercadier@imerir.com>:
> Hi Arnout & Ezequiel,
> ??and thanks for your reply.
> ??I wanted to be sure to do the right think. I will commit this patch before
> the end of this week.
>

Just a few advises:
1. Don't forget to run ./script/checkpatch.pl and
./script/get_maintainers.pl to your patch before submit.
The latter will tell you who should you send the patch to.
2. Kernel is divided in subsystems, and you should base your patches
in a specific git tree,
according to the subsystem you'll be patching.
3. Try to avoid top posting in the future, kernel devs don't like it.
4. Don't get discouraged if you get NACKS at first.

Good luck ;)
Ezequiel.
