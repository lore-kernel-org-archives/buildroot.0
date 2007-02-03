From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 3 Feb 2007 13:14:38 +0100
Subject: [Buildroot] mip32 uclibc broken - patch for uClibc-0.9.28 in
	17728
In-Reply-To: <89354.81405.qm@web62001.mail.re1.yahoo.com>
References: <89354.81405.qm@web62001.mail.re1.yahoo.com>
Message-ID: <20070203121438.GC12488@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 02, 2007 at 12:55:05PM -0800, d giddy wrote:
>mips32 for the au1200 doesn't have the correct
>options.  If this patch is the correct direction, I
>will test & confirm it works.

What revision of buildroot do you use?

Please send me your egrep -v "^(#|$)" .config from buildroot so i can
see why patching the correct MMU into uClibc's config doesn't work
for you.
