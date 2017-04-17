From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 14:50:15 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-04-04
In-Reply-To: <19D2C3F2-4C92-438A-A90C-662C225A5924@layer-7.net>
References: <20170405062834.9228220820@mail.free-electrons.com>
 <19D2C3F2-4C92-438A-A90C-662C225A5924@layer-7.net>
Message-ID: <20170417145015.6f72334a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Apr 2017 12:45:41 +0200, Michael Rommel wrote:

> the organisation SIXXS will shut down their services mi 2017. It was the only use case for the aiccu package.
> I suggest, to completely remove this package from the tree, as it will no longer be of use for anybody.
> 
> Unfortunately I could not find a section in the documentation (chapter 21) telling me, how to remove a package.

Just send a patch that removes the package, the entry in the DEVELOPERS
file and adds an entry in Config.in.legacy for the removed option.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
