From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 6 Feb 2014 13:54:37 +0000
Subject: [Buildroot] [Bug 6854] Update to Qt 5.2.1
In-Reply-To: <trinity-168d5435-c83c-40c4-b779-22995fa04816-1391694383717@3capp-gmx-bs23>
References: <bug-6854-163@https.bugs.busybox.net/>
 <20140206132343.8A7F39C817@busybox.osuosl.org>,
 <52F38EA9.2080600@imgtec.com>
 <trinity-168d5435-c83c-40c4-b779-22995fa04816-1391694383717@3capp-gmx-bs23>
Message-ID: <52F3941D.2000501@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2014 01:46 PM, Peter Kuemmel wrote:
>
>> Von: "Vicente Olivert Riera" <Vincent.Riera@imgtec.com>
>>
>> I was testing Qt-5.2.1. I agree with the removal of these patches:
>>
>> qt5base-0001-Fix-build-MIPS64-bigendian.patch
>> qt5base-0007-detect-posix_fallocate-at-configure-time.patch
>
> These patches were merged into Qt 5.2.1.
>
>>
>> --
>> Vincent
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

I know, the qt5base-0001-Fix-build-MIPS64-bigendian.patch is mine. I 
said that I *agree* with the removal of these patches :)

However, you missed the removal of this one:

qt5webkit/qt5webkit-0002-Fix-QtWebKit-build-on-ARM-softfp.patch

-- 
Vincent
