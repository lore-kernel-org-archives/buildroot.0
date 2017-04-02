From: Carlos Santos <casantos@datacom.ind.br>
Date: Sun, 2 Apr 2017 00:04:58 -0300 (BRT)
Subject: [Buildroot] Patchwork cleanup, 10 patches to look at
In-Reply-To: <20170401185204.60a79acc@free-electrons.com>
References: <20170326235320.448e802a@free-electrons.com>
 <20170401185204.60a79acc@free-electrons.com>
Message-ID: <1473812240.17283908.1491102298440.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: buildroot at uclibc.org, "Gustavo Zacarias" <gustavo@zacarias.com.ar>, "Arnout Vandecappelle" <arnout@mind.be>, "Johan
> Oudinet" <johan.oudinet@gmail.com>, "J?r?me Pouiller" <jezz@sysmic.org>, "Maxime Hadjinlian"
> <maxime.hadjinlian@gmail.com>, "Andrey Smirnov" <andrew.smirnov@gmail.com>, "Carlos Santos" <casantos@datacom.ind.br>,
> "Peter Korsgaard" <peter@korsgaard.com>, "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>, "Angelo Compagnucci"
> <angelo.compagnucci@gmail.com>
> Sent: Saturday, April 1, 2017 1:52:04 PM
> Subject: Re: [Buildroot] Patchwork cleanup, 10 patches to look at

[...]
>>  * e2fsprogs: keep util-linux's fsck if chosen
>>    https://patchwork.ozlabs.org/patch/696634/
>> 
>>    This fixes a real bug, but even Maxime who submitted the patch is
>>    not too happy with the proposal. Could someone look into this?
> 
> No progress.

Patch submitted: http://patchwork.ozlabs.org/patch/746106/

I attempted to keep the change as small as possible, since a better
solution, following Arnout's suggestions, would require an extreme
overhauling of the recipe. I will do this in the scope of fixing bug
9436 (https://bugs.busybox.net/show_bug.cgi?id=9436)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
