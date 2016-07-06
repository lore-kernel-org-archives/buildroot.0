From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Wed, 6 Jul 2016 19:04:54 +0200
Subject: [Buildroot] [V2] 4th: new package
In-Reply-To: <20160705224152.2e1e3161@free-electrons.com>
References: <1467745520-4449-1-git-send-email-francois.perrad@gadz.org>
 <20160705224152.2e1e3161@free-electrons.com>
Message-ID: <CAB0FRss1DfjWSa6K9w0Np99ntsxiUsZgq9ZO55zBiqz6PKmwzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2016-07-05 22:41 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> When doing a new iteration of a patch, please add a changelog that
> indicates what has been changed.
>
> On Tue,  5 Jul 2016 21:05:20 +0200, Francois Perrad wrote:
>
>> +4TH_VERSION = 3.62.4
>> +4TH_SOURCE = 4th-$(4TH_VERSION)-unix.tar.gz
>> +4TH_SITE = http://downloads.sourceforge.net/project/forth-4th/4th-$(4TH_VERSION)
>> +4TH_LICENSE = GPLv3, LGPLv3
>> +4TH_LICENSE_FILES = COPYING
>
> Did you resolve the licensing issue? That was the main point of my
> previous review:

After double checking, it appears that most of files in the latest
release are under GPLv3 and the others are under LGPLv3.

Fran?ois

>
> """
> I was about to apply your patch, with some minimal changes (see
> http://code.bulix.org/i2s65n-101064), but there is one fundamental
> license issue here.
>
> The COPYING file, as well as documentation/license.txt contain the
> license text of the LGPLv3. But the source code (sources/*.c) all claim
> to be licensed under the GPLv3. Only the .4th files are under LGPLv3.
>
> This is clearly not good. Could you talk with upstream to get this
> situation resolved?
> """
>
> At least some reply from you about this would have been useful to
> understand what's going on.
>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
