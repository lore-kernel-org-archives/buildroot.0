From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 7 Mar 2018 11:30:11 -0300
Subject: [Buildroot] Board defconfigs lacking maintainers
In-Reply-To: <20180307150418.4b19ba57@windsurf>
References: <20180304231547.7ed3f5af@windsurf.home>
 <20180305120722.GD7096@momiji>
 <20180305133713.0232b1b3@windsurf.home>
 <CAAEAJfB-D3FFVrWdxkb2ENciYj=YpP4qSKwxd1NDLzgfFTrLnA@mail.gmail.com>
 <20180307150418.4b19ba57@windsurf>
Message-ID: <CAAEAJfBznM3BrY7cHpyMJxpMNsTG5i_KJgbe7t4YeiaA5ef_3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 7 March 2018 at 11:04, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Wed, 7 Mar 2018 10:41:37 -0300, Ezequiel Garcia wrote:
>
>> >> One if my work colleagues has a ci20 around which I *think* he has been using
>> >> mostly with Buildroot as the base system. I'll get to him and see whether it
>> >> may be possible for one of us to adopt this one.
>> >
>> > Great! This defconfig was initially contributed by Vicente Olivert
>> > Riera, but he has left Imagination Technologies, so he is no longer
>> > working on Buildroot or MIPS.
>> >
>>
>> Should nobody adopt Ci20, I will. I'm working on it as pet project.
>
> Please submit a patch to the DEVELOPERS file then :-)
>

I will.

> The ci20_defconfig build is currently broken, due to MIPS gcc flags
> issues. A patch has been submitted, but we haven't merged it yet.
>

I know. I pinged you ages ago.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
