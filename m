From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 10 Dec 2013 16:24:59 -0800
Subject: [Buildroot] [PATCH 0/2] update sunxi-boards and sunxi-tools for
	pcDuino board
Message-ID: <1386721499.2817.17.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In preparation for adding support for for the pcduino board, update the
sunxi-boards and sunxi-tools to the commit recommended for pcduino.

These packages are also used by the Cubieboard so if somebody with a
Cubieboard could test this that would be good.

Brian Beattie (2):
  update sunxi-boards to newer commit as recomended for pcDuino board
  update sunxi-boards to newer commit as recomended for pcDuino board

 package/sunxi-boards/sunxi-boards.mk | 2 +-
 package/sunxi-tools/sunxi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.8.1.2


-- 
"For every complex problem there is an answer that is clear, simple, and
wrong." -- H. L. Mencken

Brian Beattie<beattie@beattie-home.net> -- www.brian-beattie.com
LFS12947
