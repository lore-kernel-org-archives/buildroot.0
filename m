From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 22:40:13 +0200
Subject: [Buildroot] [PATCH] python modules search in non english locale
 (zlib, ...)
In-Reply-To: <55184DA0.1050901@armadeus.com>
References: <5515E2AC.3010100@armadeus.com>
 <20150329144607.0e60928f@free-electrons.com>
 <55184DA0.1050901@armadeus.com>
Message-ID: <20150329224013.0d330434@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear S?bastien Royen,

On Sun, 29 Mar 2015 21:08:16 +0200, S?bastien Royen wrote:

> I should not submit patch of patch too late in the evening.
> I hope the version below is better.

Yes and no. It's better because it's a Buildroot patch, but it's still
not good since it's not a Git formatted patch.

> Not tested with python3, and not sure toolchain output language shouln't
> be fix in another way to avoid same problem on other packages.

Maybe we should export LC_ALL globally, or something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
