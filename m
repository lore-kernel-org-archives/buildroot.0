From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 4 Dec 2006 17:26:26 +0100
Subject: [Buildroot] 2.6.16 kernel headers
In-Reply-To: <20061204152218.171330@gmx.net>
References: <20061204152218.171330@gmx.net>
Message-ID: <20061204162626.GA25253@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 04, 2006 at 04:22:18PM +0100, Real.Magic at gmx.de wrote:
>I am going to use Linux kernel 2.6.16 for PowerPC from ftp://ftp.denx.de/pub/linux, but I could not found the matching kernel header files in buildroot menu.
>In this menu only 2.6.12 and 2.6.18 are available.

buildroot has sanitized kernel headers up to 2.6.12 (from Mazur) or the
headers_install kernel headers from 2.6.19.
>
>How can I build the toolchain for 2.6.16 kernel?
select 2.6.12 headers.
You can run about any kernel you want.

HTH,
