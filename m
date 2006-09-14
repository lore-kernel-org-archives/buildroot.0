From: Marcel Birthelmer <marcel@carrietech.com>
Date: Thu, 14 Sep 2006 10:24:21 -0700
Subject: [Buildroot] [BUILDROOT] root file system is mounted as ro
In-Reply-To: <168bf0160609140029r77cb95b1mbfa7d32624c615d@mail.gmail.com>
References: <168bf0160609140029r77cb95b1mbfa7d32624c615d@mail.gmail.com>
Message-ID: <45099045.5080505@carrietech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Surrel wrote:
> Hi,
> 
> I have a problem with recent buildroot : when booting Linux, the root
> file system is always mounted as ro, whereas it was not with older
> versions. A remount as rw makes the trick, but it is quite annoying to
> have to do that. Does anyone have an idea where to start looking to
> solve that problem or where that problem comes from ?
> 
> Thanks in advance !
> 
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

Just put "rw" instead of "ro" in your boot configuration (in your
bootloader config).
- Marcel
