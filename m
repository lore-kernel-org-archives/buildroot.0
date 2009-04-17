From: Sven Neumann <s.neumann@phase-zero.de>
Date: Fri, 17 Apr 2009 15:04:29 +0200
Subject: [Buildroot] autoreconf fails
In-Reply-To: <1239965054.6397.13.camel@sven>
References: <1239964392.6397.11.camel@sven>  <1239965054.6397.13.camel@sven>
Message-ID: <1239973469.6397.16.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I found that my problems were caused by some custom packages in our tree
that had not been updated to use host-pkgconfig. After I fixed that and
started from a fresh tree, the problems were gone. Sometimes it is
really hard to determine the actual root of build problems. I apologize
for the noise I made...


Sven
