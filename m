From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:01:07 +0200
Subject: [Buildroot] [PATCH v2 4/4] board/minnowboard-max: Add a X-based
 graphical defconfig
In-Reply-To: <1460735767-2577-5-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460735767-2577-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460735767-2577-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <20160415220107.585d1fb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 12:56:07 -0300, Ezequiel Garcia wrote:

>  .../fs-overlay-graphical/usr/bin/startx            | 248 +++++++++++++++++++++

This script looks really long and complicated. Where does it come from?
Is it really specific to the Minnowboard?

Another open question is whether we should add some details in
readme.txt about this configuration, like which demos are provided,
example commands to run to test the whole thing, etc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
