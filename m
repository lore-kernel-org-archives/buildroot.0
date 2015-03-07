From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sat, 7 Mar 2015 05:33:03 -0500
Subject: [Buildroot] [PATCH v2] lttng-libust: bump to version 2.6.0
In-Reply-To: <20150307110827.1a6648ad@free-electrons.com>
References: <1425689293-8210-1-git-send-email-eeppeliteloop@gmail.com>
 <20150307110827.1a6648ad@free-electrons.com>
Message-ID: <CAB4xu_250zwHKoCJWR9xXVpfe=7ErKOSP9JgpUFHQ0ZFHb2ELw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 7, 2015 at 5:08 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Philippe Proulx,
>
> On Fri,  6 Mar 2015 19:48:13 -0500, Philippe Proulx wrote:
>
>> -LTTNG_LIBUST_LICENSE_FILES = COPYING
>> +LTTNG_LIBUST_LICENSE_FILES = gpl-2.0.txt lgpl-2.1.txt mit-license.txt COPYING LICENSE
>
> Did you actually test this change by running "make legal-info" ? I had
> a look at the lttng-libust tarball, and there are no files named
> gpl-2.0.txt and so on, only a 'COPYING' file. So I believe this
> variable shouldn't be changed.

Err, sorry. I looked at the Git tree for license files, but it looks
like they're not packaged.

Phil

>
> I've applied your patch after fixing this.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
