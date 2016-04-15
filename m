From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 22:14:18 +0200
Subject: [Buildroot] [PATCH v2 4/4] board/minnowboard-max: Add a X-based
 graphical defconfig
In-Reply-To: <CAAEAJfAgt5e6QK2aKLiit-upNmi1AWmcOUz5qDtqQU+EYMf0nA@mail.gmail.com>
References: <1460735767-2577-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460735767-2577-5-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20160415220107.585d1fb2@free-electrons.com>
 <CAAEAJfAgt5e6QK2aKLiit-upNmi1AWmcOUz5qDtqQU+EYMf0nA@mail.gmail.com>
Message-ID: <20160415221418.0040673d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 17:11:56 -0300, Ezequiel Garcia wrote:

> Nope, it's the standard startx script, provided by the xinit package.

The big question now is why do you have this script in an overlay
rather than using the one provided by the xinit package?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
