From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Date: Wed, 1 May 2013 15:03:16 -0700
Subject: [Buildroot] Buildroot + CoudeSourcery 2012.09
Message-ID: <82bbf577-2fa7-4161-aa47-e18b223fc7be@CO9EHSMHS011.ehs.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I recently encountered some weird behavior, and couldn't really find
anything about it.

When I compile a rootfilesystem with CS2012.09 it looks like globbing is
broken, resulting in init scripts are not executed.

Using CS2012.03 and older works fine.

The default shell is ash including bash compatibility stuff.

Did anybody else see something like this?

	Thanks,
	S?ren
