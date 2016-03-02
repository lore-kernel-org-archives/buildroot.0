From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 2 Mar 2016 22:50:32 +0100
Subject: [Buildroot] [PATCH] lksctp-tools: new package
In-Reply-To: <20160302223946.381d88ce@free-electrons.com>
References: <1456952871-14155-1-git-send-email-gustavo@zacarias.com.ar>
 <20160302222600.618f2a64@free-electrons.com>
 <56D75D35.5050201@zacarias.com.ar>
 <20160302223946.381d88ce@free-electrons.com>
Message-ID: <CAGm1_ksdcbvDerS1LUfn1=w_hvmDt8o1mQwMpGGSOzkDQY2UjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Gustavo,

On Wed, Mar 2, 2016 at 10:39 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 2 Mar 2016 18:37:57 -0300, Gustavo Zacarias wrote:
>
>> Gah missed it, interval between "need it" and "submit it" was short enough.
>> Still, would be good to spin a v3 with the source code purge otherwise a
>> bunch of .c files end in the target.
>
> Your review on Yegor's v2 will be much appreciated :-)

The only differences are placement, i.e. moving lksctp-tools to
networking libraries instead of tools and adding another hook. I can
respin v3 with these changes.

Gustavo, what are you using it for? I was interested in cannelloni
package, that depends on it.

Yegor
