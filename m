From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 14 Aug 2013 21:23:32 +0200
Subject: [Buildroot] [PATCH] toolchain: improving lib{32,64} symlinks
In-Reply-To: <CAG2jQ8g_Z1FzYo+0Ad7PcgdSi1i=gYbRZQTd15T1RL9-W286Dw@mail.gmail.com>
References: <1376482737-27650-1-git-send-email-s.martin49@gmail.com>
 <CAG2jQ8g_Z1FzYo+0Ad7PcgdSi1i=gYbRZQTd15T1RL9-W286Dw@mail.gmail.com>
Message-ID: <CAHXCMMKnMa-KZQN-VD_3N8eU1NoNg7E-JeQH6w28FqhvZbz+4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/8/14 Markos Chandras <markos.chandras@gmail.com>:
>
> Hi Samuel,
>
> I've tested this patch for MIPS, MIPS64 o32 and n32 in both BR and
> Sourcery Codebench toolchains and it seems to work fine. It certainly
> fixes the n32 interp issue for MIPS. You have my
>
> Tested-by/Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Great! Thanks.

>
> Thank you!
>
> ps: The http://autobuild.buildroot.net/results/23fb6b1479d2b5906b72c9437b06ab4700ff246d
> returns 404 for me
arf... I forgot the trailing slash! The redirection does not work without :-(
Anyway, the actual url is:
http://autobuild.buildroot.net/results/23f/23fb6b1479d2b5906b72c9437b06ab4700ff246d

Regards,

-- 
Samuel
