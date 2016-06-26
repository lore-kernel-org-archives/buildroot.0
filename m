From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jun 2016 14:36:12 +0200
Subject: [Buildroot] [PATCH v2] qt5: bump version to 5.6.1-1
In-Reply-To: <20160626002458.286ad9b8@gmx.net>
References: <1466801021-32264-1-git-send-email-ps.report@gmx.net>
 <20160625154206.6b576d3e@free-electrons.com>
 <20160626002458.286ad9b8@gmx.net>
Message-ID: <20160626143612.327ef099@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Jun 2016 00:24:58 +0200, Peter Seiderer wrote:

> Thanks for committing, but something went wrong, your committed Patch v1 instead of Patch v2...

Gaah sorry.

> The difference was the following line in the commit message:
> 
> >   - qt5base: https://github.com/qtproject/qtbase/commit/b8f98d956501dfa4ce03a137f15d404930a56066.patch (upstream committed)  
> 
> and the fix for qt5enginio version:
> 
>  -QT5ENGINIO_VERSION = 1.6.0
>  +QT5ENGINIO_VERSION = 1.6.1
> 
> Should I send a follow up patch fixing qt5enginio?

Yes, please send a follow-up patch. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
