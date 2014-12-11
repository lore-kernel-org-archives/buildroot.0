From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Dec 2014 00:13:07 +0100
Subject: [Buildroot] [PATCHv2 0/3] Improved static/shared library
 handling
In-Reply-To: <1418338211-1595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1418338211-1595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141212001307.14e0dfa9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 11 Dec 2014 23:50:08 +0100, Thomas Petazzoni wrote:

> Thomas Petazzoni (3):
>   Turn the static lib option into a choice with more options
>   ncurses: better handling for shared/static library
>   Build shared libraries only as the default

Series applied, with the minor comment on PATCH 1/3 from Yann addressed.

As you can imagine PATCH 3/3 might cause quite a bit of autobuilder
failures. Do not hesitate to monitor them and help fix them if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
