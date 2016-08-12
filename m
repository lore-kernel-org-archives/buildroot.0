From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Aug 2016 22:26:02 -0700
Subject: [Buildroot] eudev compilation fails on buildroot-2016.08-rc1
In-Reply-To: <CAFN-Ez51T+Z-3t_15sWgPDgrvRYRyW6raiDvbC744cgVcqiJ8w@mail.gmail.com>
References: <CAFN-Ez51T+Z-3t_15sWgPDgrvRYRyW6raiDvbC744cgVcqiJ8w@mail.gmail.com>
Message-ID: <B38B0459-FF73-4DFC-9189-F46BEB90F0BC@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 10, 2016, at 7:57 AM, Chetan Kumar <shivakumar.chetan@gmail.com> wrote:
> 
> Hi,
> 
> I am trying to build eudev on buildroot-2016.08-rc1, it fails at below
> 
> checking for gawk... (cached) mawk
> checking for /home/buildroot-2016.08-rc1/output/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc option to accept ISO C99... unsupported
> configure: error: no C99 compiler found, eudev requires a C99 compiler.
> make[1]: *** [/home//buildroot-2016.08-rc1/output/build/eudev-3.2/.stamp_configured] Error 1

There should be a config.log file in eudev builddir which should list the failure
why configure failed. Please share config.log

> make: *** [_all] Error 2
> 
> 
> Any help ?
> 
> Thanks
> C
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160811/9e75b1f0/attachment.asc>
