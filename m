From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 27 Aug 2015 14:39:18 +0200
Subject: [Buildroot] [PATCH] pacakge/qt5/qt5base: fix build with ccache
In-Reply-To: <55DED48F.3030102@wsystem.com>
References: <1440499298-39957-1-git-send-email-benoit@wsystem.com>
 <20150826154534.3e67c9bc@free-electrons.com>
 <CA+sos7-LVKNjkVc+1hg0w8WZMGEtnthaJnaA7-fUKEOizjJCeg@mail.gmail.com>
 <55DEC67C.6000500@wsystem.com>
 <20150827105450.100164af@free-electrons.com>
 <55DED48F.3030102@wsystem.com>
Message-ID: <20150827143918.1dc522a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t,

On Thu, 27 Aug 2015 11:12:47 +0200, Beno?t Th?baudeau wrote:

 > OK, but in the meantime, until we have a wrapper for the internal toolchain too,
> what do you want to do to fix the current build failure?
>  - Forbid the use of ccache with Qt 5?
>  - Use the current patch?
>  - Use the wrapper from the URL above? In that case, where would you put it in
>    Buildroot (qt5base, new package, toolchain, support)?

For 2015.08, your patch is certainly the simplest solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
