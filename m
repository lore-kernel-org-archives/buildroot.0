From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 27 Feb 2020 15:06:06 -0800
Subject: [Buildroot] Analysis of build results
In-Reply-To: <20200227234905.44125454@windsurf.home>
References: <20200227093138.523B887666@whitealder.osuosl.org>
 <20200227234905.44125454@windsurf.home>
Message-ID: <CAMo8BfJaSdYUG=JL1=vTSFT91373kC4=FQo1=Sbw=ho_d2+XOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 27, 2020 at 2:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> >    xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/7885705f1b1c0f31cf21b464150f5509929c1906 |
>
> Toolchain issue:
>
> BFD (GNU Binutils) 2.31.1 internal error, aborting at elf32-xtensa.c:3283 in elf_xtensa_finish_dynamic_sections
>
> Max, any idea ?

Looking at it, thanks for the heads up!

-- 
Thanks.
-- Max
