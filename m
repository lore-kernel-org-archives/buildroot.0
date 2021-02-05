From: =?UTF-8?Q?Stefan_S=C3=B8rensen?= <stefan@astylos.dk>
Date: Fri, 5 Feb 2021 15:00:48 +0100
Subject: [Buildroot] [PATCH] package/netsnmp: bump version to 5.9
In-Reply-To: <20210205130547.GX2384@scaer>
References: <20210205100021.3110944-1-stefan.sorensen@spectralink.com>
 <20210205100021.3110944-2-stefan.sorensen@spectralink.com>
 <20210205130211.GV2384@scaer> <20210205130547.GX2384@scaer>
Message-ID: <CAFF=tqVX8X9_ZQWtq4zqBz7Tao_LnG7oQC_G7tcB9v8y+AmYQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 5 Feb 2021 at 14:05, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

> Stefan, All,
>
> On 2021-02-05 14:02 +0100, Yann E. MORIN spake thusly:
> > On 2021-02-05 11:00 +0100, stefan at astylos.dk spake thusly:
> > > From: Stefan S?rensen <stefan.sorensen@spectralink.com>
> > > - Rebased patches 1 and 4
> > I know you are only rebasing existing patches, but something isfishy
> > with patches 1 and: they both touch the file 'configure', but we do have
>
> *is fishy
> *patches 1 and 2
>

Yes those parts are useless, but patches 1 and 2 are in upstream master
([1], [2]), so I opted to just rebase the original content.

But I can respin and remove those parts if wanted?

Stefan

[1]
https://sourceforge.net/p/net-snmp/code/ci/bd59be8e4e339870a1400f6866a7b73ca11f6460/
[2]
https://sourceforge.net/p/net-snmp/code/ci/13da2bcde8e22dd0127a668374fdf79bed04d353/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210205/0202abfe/attachment.html>
