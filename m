From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 15 Nov 2018 11:22:45 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-14
In-Reply-To: <20181115070028.760D7207BB@mail.bootlin.com>
References: <20181115070028.760D7207BB@mail.bootlin.com>
Message-ID: <CANQCQpZRsbTf_OfruKiZNES6Dpm1XGm+nnaAaGZcnw4R1KjOxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,


On Thu, Nov 15, 2018 at 1:00 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> Build statistics for 2018-11-14
> ===============================
>

>      aarch64 |                     xen-4.10.2 | NOK | http://autobuild.buildroot.net/results/6e0d8e962e861a32f5bf2e5031ef51c25768f1f6 |

I'm working on a series of patches to fix this failure(s).  Looks like
a bunch of array-bounds fixups. (I fixed this failure and got another,
3 deep so far...)

Matt
