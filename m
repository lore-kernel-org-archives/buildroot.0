From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:49:20 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/openobex: fix broken
 download URL, add hash
In-Reply-To: <8760yajb1p.fsf@dell.be.48ers.dk>
References: <1454233738-8795-1-git-send-email-bernd.kuhls@t-online.de>
 <8760yajb1p.fsf@dell.be.48ers.dk>
Message-ID: <20160207154920.4e565ee9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Sun, 31 Jan 2016 11:30:42 +0100, Peter Korsgaard wrote:

> I see upstream has released 1.7.1 (in a normall tarball). Any reason we
> don't use that instead?

1.7.1 is now using a CMake based build system rather than autotools, so
it's a much bigger change, which can be handled separately.

So I've taken Bernd's patch as is, but it would be nice to upgrade to
1.7.1 at some point.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
