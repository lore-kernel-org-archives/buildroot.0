From: Bernhard Fischer <rep.nop@aon.at>
Date: Fri, 8 Dec 2006 13:41:18 +0100
Subject: [Buildroot] uClibc doesn't include legacy SuSv3 support by
	default anymore...
In-Reply-To: <820140.22973.qm@web35601.mail.mud.yahoo.com>
References: <820140.22973.qm@web35601.mail.mud.yahoo.com>
Message-ID: <20061208124118.GB4442@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 06, 2006 at 05:08:54PM -0800, Andre wrote:
>
>http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi?rev=16732&view=rev
>
>SuSv3 legacy support is required to build apps such as Wireless
>Tools. Tweak Buildroot's default uClibc.config to compensate:

If you want a LEGACY system, then 'make uclibc-menuconfig' and turn it on
yourself. Per default, we strive to remove the legacy cruft.
