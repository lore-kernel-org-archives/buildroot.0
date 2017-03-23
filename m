From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Mar 2017 10:46:35 +0100
Subject: [Buildroot] [PATCH 1/1] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <3767f162-d03e-1480-7f79-c7c38f3cfeea@c-sky.com>
References: <1488801152-13368-1-git-send-email-ren_guo@c-sky.com>
 <20170320224839.6677ccd0@free-electrons.com>
 <d2d57c6c-b3b0-2bc8-71a4-d6fe3578a804@c-sky.com>
 <20170323101042.186c3fc6@free-electrons.com>
 <b11495d8-a875-decb-ad32-4ff257023ac6@c-sky.com>
 <20170323102331.6f245905@free-electrons.com>
 <3767f162-d03e-1480-7f79-c7c38f3cfeea@c-sky.com>
Message-ID: <20170323104635.77664363@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Mar 2017 17:32:32 +0800, ren_guo wrote:

> Yes, it's wrong in my example, and I want use post-image.sh to copy the gdbinit to the output/images.

I think it's a bit annoying/useless to copy the gdbinit file around.
Why not keep it where it is?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
