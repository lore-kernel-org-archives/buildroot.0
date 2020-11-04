From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 08:25:52 +0100
Subject: [Buildroot] [PATCH v2] board: add Orangepi Zero Plus support
In-Reply-To: <20201029195331.3894-1-m.niestroj@grinn-global.com> (Marcin
 Niestroj's message of "Thu, 29 Oct 2020 20:53:31 +0100")
References: <20201029195331.3894-1-m.niestroj@grinn-global.com>
Message-ID: <87k0v14m7z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:

 > Add initial support for Orangepi Zero Plus board:
 > - U-Boot 2020.10
 > - Linux 5.7.19
 > - Default packages from buildroot

 > This patch is based on Orangepi Zero Plus2 board support, so genimage
 > configuration and description is copy pasted. One difference is that
 > newer Linux and U-Boot are selected. Another difference is Ethernet
 > support (Plus) instead of WiFi (Plus2).

 > Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
 > ---
 > changes v1 -> v2:
 >  * rebase on Buildroot master
 >  * bump U-Boot from 2020.04 to 2020.10
 >  * bump Linux from 5.6.6 to 5.7.19

Committed, thanks.

I wonder if we could combine some of all these orangepi defconfigs and
create a single build that works on multiple boards rather than
maintaining all these almost similar files?

-- 
Bye, Peter Korsgaard
