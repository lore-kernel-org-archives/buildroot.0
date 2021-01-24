From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 16:25:42 +0100
Subject: [Buildroot] [PATCH 0/3] package/sysklogd: version bump,
 some fixes, and more menuconfig
In-Reply-To: <20210124094018.GK926565@scaer>
References: <20210122154333.1927190-1-troglobit@gmail.com>
 <20210124094018.GK926565@scaer>
Message-ID: <87v9bmuzk9.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jan 24, 2021 at 10:40, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-22 16:43 +0100, Joachim Wiberg spake thusly:
>>   package/sysklogd: bump to verson 2.2.0
>>   package/sysklogd: add menuconfig support for enabling native logger
>>   package/sysklogd: menuconfig support for remote syslog retry delay
> All three patches applied to master, thanks.
> Please review my comments and rework on patch 1. I also slightly
> reworked patch 2 to use the more traditional ifew-else-endif block
> rather than the $(if) construct.

Looks good, much better with your rework.  Only issue, as I mentioned in
the previous thread, is the install path for the logger tool, which I'm
posting another patch for.

Thank you! :)

Regards
 /Joachim
 
