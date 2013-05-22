From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed, 22 May 2013 11:33:56 +0200
Subject: [Buildroot] Does buildroot toolchain support GNU EABI?
In-Reply-To: <20130522092041.GA15526@zuhnb712.ap.bm.net>
References: <20130522092041.GA15526@zuhnb712.ap.bm.net>
Message-ID: <CAGm1_kt83BK9b4vQqZpH+mjArK6SmbhdruUUEn4TSAUcS2JXXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 22, 2013 at 11:20 AM, Woody Wu <narkewoody@gmail.com> wrote:
> Hi,
>
> I found my buildroot toolchain is using EABI version 5. But I want to
> create executable run an existed system that is using GNU EABI.
>
> Actuall, I don't know what GNU EABI is.  Can I configure buildroot to
> support this? And, how?

BR toolchains are always EABI unless you specify it to generate OABI
binaries. See Wikipaedia for EABI info:
http://en.wikipedia.org/wiki/EABI#EABI

Yegor
