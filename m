From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 22 Aug 2018 09:22:51 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-08-21
In-Reply-To: <20180822060008.9A34120DB5@mail.bootlin.com>
References: <20180822060008.9A34120DB5@mail.bootlin.com>
Message-ID: <CANQCQpZxECJsfmdPMN6Szq2Gr7U4z3HaftPmGoKm6vr23yavSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Wed, Aug 22, 2018 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2018-08-21, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Results for the '2018.02.x' branch
> ==================================
>
> Build failures related to your packages:
>
>          arm |            host-libselinux-2.7 | http://autobuild.buildroot.net/results/ec2e3ecbe3f781571d63cd9a92f7f8ac0dd77fe7
>    powerpc64 |            host-libselinux-2.7 | http://autobuild.buildroot.net/results/a8d1009d8c3445b39483e7ed1d3304f7cbb18055

2018.02.x needs a couple commits picked over to fix these failures.

6288409642d8368104f916bd264d2cb042942dfa  # adds atomic ops patch
cb8d1743cab1449b91afbabe38c64cbb85bef6ba  # fixes patch naming/paths
so it applies

Thanks!
Matt
