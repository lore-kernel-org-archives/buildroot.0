From: Matthew Weber <matt@thewebers.ws>
Date: Sun, 17 Jan 2016 09:06:57 -0600
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160117001117.569d43f2@free-electrons.com>
References: <20160116073021.A4B95101BCC@stock.ovh.net>
 <20160117001117.569d43f2@free-electrons.com>
Message-ID: <CAFt09wO1BMKF_Quupk-vPGFubANmdQc61ggtNyhAnHyzs7tjXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jan 16, 2016 at 5:11 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Gustavo, Vicente, J?rg, Frank, Bernd, Maxime, Carsten, Davide, Jeremy,
> VIcente, Gilles, Gary, Romain, Matt, Waldemar, Fran?ois, Alexey, Joris,
> Volkov: there are some specific build failures for which your help
> would be appreciated. See below. Thanks in advance for your help!
>

<snip>

>>       x86_64 |              iputils-s20121011 | NOK | http://autobuild.buildroot.net/results/12cb73f3def95efe706bcd957bc2c091e7931d5a/
>
> Musl build issue. Matt, can you have a look ?

Looks like the development was moved to github and there have been
updates to support uClibc and musl-libc.  I'll work on a patch to
update the upstream location and hopefully also remove the one patch
that package has for a ping issue.

Thanks,
Matt
