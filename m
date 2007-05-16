From: Brian Austin <brian.austin@cirrus.com>
Date: Wed, 16 May 2007 02:58:48 -0500
Subject: [Buildroot] EABI toolchains do not free init in busybox
In-Reply-To: <20070516073530.GB2056@z1.synertronixx>
References: <1179227741.17486.52.camel@localhost.localdomain>
	<20070516073530.GB2056@z1.synertronixx>
Message-ID: <1179302328.17486.79.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yea, that was the problem.  I have been building this in an automated
system and I was initially building an OABI kernel, then an EABI kernel,
and the wrong one was being placed in the tftp directory.

my bad.

Thanks



On Wed, 2007-05-16 at 09:35 +0200, Konstantin Kletschke wrote:
