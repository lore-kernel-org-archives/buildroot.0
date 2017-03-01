From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 1 Mar 2017 20:09:30 +0100
Subject: [Buildroot] Ethernet not working with imx6ulevk
In-Reply-To: <CAKkGsYLnkPh=c2ZU=m2ju04oxvZsX-OT8PaAMtywL65TDvCNzQ@mail.gmail.com>
References: <CAKkGsYK+WPvgH-SQ9L_cbBkjCOOXK9YE4ty6L5wQDhJOmYR==Q@mail.gmail.com>
 <CAKkGsYLpW+bU-SihBgRFgyi4cmzJhgah1ZDpjQf0m2ksEmKP_A@mail.gmail.com>
 <f974facb-71d8-5498-cfc5-df451a58d27a@mind.be>
 <CAKkGsYLnkPh=c2ZU=m2ju04oxvZsX-OT8PaAMtywL65TDvCNzQ@mail.gmail.com>
Message-ID: <e07c7dd0-4871-302e-0fc6-fffb8c12e005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-03-17 12:53, Taceant Omnes wrote:
> On 28 February 2017 at 22:42, Arnout Vandecappelle <arnout@mind.be> wrote:
>>  Note that this patch is apparently included in rel_imx_4.1.15_2.0.1_ga. So, can
>> you update configs/freescale_imx6ulevk_defconfig to 2.0.1, verify that it works,
>> and send a patch to Buildroot?
> 
> Hi Arnout,
> 
> Just replacing 2.0.0 with 2.0.1 for the kernel and u-boot in the BR
> defconfig will not work. I am not an expert neither on BR nor on git,
> nevertheless my guess is that it does not work because there is no
> rel_imx_4.1.15_2.0.1_ga tag for the kernel nor for u-boot.

 D'oh, I don't know what I've been smoking... I *checked* it, I can even find
the 'git ls-remote' in my command history...

 So never mind :-)


 Regards,
 Arnout

> 
> http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/
> http://git.freescale.com/git/cgit.cgi/imx/uboot-imx.git/
> 
> Cheers.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
