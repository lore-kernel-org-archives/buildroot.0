From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 25 Aug 2015 08:35:45 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-08-24
In-Reply-To: <20150825125744.406bc9c1@free-electrons.com>
References: <20150825063012.C9C1510159F@stock.ovh.net>
 <55DC42A1.6060003@imgtec.com> <20150825123933.382f5e06@free-electrons.com>
 <55DC479B.6000406@imgtec.com> <20150825125744.406bc9c1@free-electrons.com>
Message-ID: <55DC5311.4000500@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/08/15 07:57, Thomas Petazzoni wrote:

>>>>>      mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/80ffdf54fd675fbff5a645784cd041cdf862154c/
>>>>>      mips64el |                   midori-0.5.9 | NOK | http://autobuild.buildroot.net/results/1c049845ade60de223296c77c8a70869c4db64f0/
>>>>
>>>> Currently investigating.
>>>
>>> Thanks!
>>
>> And cannot reproduce it :/ Sorry, let's see if future build reports
>> still hightlight this failure.
>
> Well:
>
> --   package 'webkit2gtk-3.0>=1.11.91' not found
> --   package 'javascriptcoregtk-3.0' not found
>
> and we don't have webkit2gtk-3.0, we only have webkit2gtk. But I'm a
> bit surprised, since Gustavo bumped webkitgtk and midori at the same
> time. Gustavo, can you have a look?

webkit2gtk-3.0 means webkit API 2 (new) for gtk 3, which is correct 
since the config has libgtk3 enabled.
This curious naming is used so that multiple variants can live 
side-by-side (different screen rendering backends and APIs).
I'll give it a look.
Regards.
