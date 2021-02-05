From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 5 Feb 2021 22:37:59 +0100
Subject: [Buildroot] [PATCH] package/netsnmp: bump version to 5.9
In-Reply-To: <CAFF=tqVX8X9_ZQWtq4zqBz7Tao_LnG7oQC_G7tcB9v8y+AmYQg@mail.gmail.com>
References: <20210205100021.3110944-1-stefan.sorensen@spectralink.com>
 <20210205100021.3110944-2-stefan.sorensen@spectralink.com>
 <20210205130211.GV2384@scaer> <20210205130547.GX2384@scaer>
 <CAFF=tqVX8X9_ZQWtq4zqBz7Tao_LnG7oQC_G7tcB9v8y+AmYQg@mail.gmail.com>
Message-ID: <20210205213759.GA2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On 2021-02-05 15:00 +0100, Stefan S?rensen spake thusly:
> On Fri, 5 Feb 2021 at 14:05, Yann E. MORIN < [1]yann.morin.1998@free.fr> wrote:
>   On 2021-02-05 14:02 +0100, Yann E. MORIN spake thusly:
>   > On 2021-02-05 11:00 +0100, [2]stefan at astylos.dk spake thusly:
>   > > From: Stefan S?rensen < [3]stefan.sorensen@spectralink.com>
>   > > - Rebased patches 1 and 4
>   > I know you are only rebasing existing patches, but something isfishy
>   > with patches 1 and: they both touch the file 'configure', but we do have
> 
>   *is fishy
>   *patches 1 and 2
> 
> Yes those parts are useless, but patches 1 and 2 are in upstream master ([1], [2]), so I opted to just rebase the original content.
> But I can respin and remove those parts if wanted?

Ah, if they are backports, then we want them as-is, indeed! But the
existing patches we have do not state that they are, hence I was
mislead...

I will apply your patch, adding the two commits you reference below to
the patches we carry.

Thanks for the feedback! :-)

Regards,
Yann E. MORIN.

> Stefan
> [1]? [4]https://sourceforge.net/p/net-snmp/code/ci/bd59be8e4e339870a1400f6866a7b73ca11f6460/
> [2]? [5]https://sourceforge.net/p/net-snmp/code/ci/13da2bcde8e22dd0127a668374fdf79bed04d353/
> ?
> 
> Links:
> 1. mailto:yann.morin.1998 at free.fr
> 2. mailto:stefan at astylos.dk
> 3. mailto:stefan.sorensen at spectralink.com
> 4. https://sourceforge.net/p/net-snmp/code/ci/bd59be8e4e339870a1400f6866a7b73ca11f6460/
> 5. https://sourceforge.net/p/net-snmp/code/ci/13da2bcde8e22dd0127a668374fdf79bed04d353/

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
