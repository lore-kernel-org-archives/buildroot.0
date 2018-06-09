From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Sat, 9 Jun 2018 11:19:27 -0700
Subject: [Buildroot] [RFC PATCH 1/8] atk: bump to version 2.25.2
In-Reply-To: <20180609193632.7068bc29@windsurf>
References: <20180608225932.13127-1-joseph.kogut@gmail.com>
 <20180608225932.13127-2-joseph.kogut@gmail.com>
 <20180609193632.7068bc29@windsurf>
Message-ID: <CAMWSM7iq4iQ+n9aM_nwXeWVPZW9x3G=sWVKjQM8X3Zr-gh9-Cg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jun 9, 2018 at 10:36 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> Thanks for this patch series!
>

No problem, I think it's a great value add, it was fun to work on, and
I personally have uses for it.

> On Fri,  8 Jun 2018 15:59:25 -0700, Joseph Kogut wrote:
>
>> -ATK_VERSION_MAJOR = 2.22
>> -ATK_VERSION = $(ATK_VERSION_MAJOR).0
>> +ATK_VERSION_MAJOR = 2.25
>
> I *think* in the gnome project the odd version numbers are for
> development versions. I.e 2.22 is stable, 2.24 is stable, 2.25 is
> development. Also, why use 2.25, if 2.28 and 2.29 are available:
>
>   https://ftp.gnome.org/pub/gnome/sources/atk/
>

Good question. I've been working on this for a while, so I don't
remember specifically why I chose that version, but I think it had
something to do with one of the at-spi2 packages requiring 2.25.2 as
the minimum version, and that's what I went with. I should've checked
if there was a newer compatible version available. I'll respin this
with the newest stable release and resubmit.

There's also a cross-compile issue I spotted yesterday, so I'll work
on that as well.

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
