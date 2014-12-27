From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 21:38:14 +0100
Subject: [Buildroot] [PATCH v5 06/15] gpu-viv-bin-mx6q: change output
 selection mechanism
In-Reply-To: <1418132813-32642-7-git-send-email-jezz@sysmic.org>
References: <1418132813-32642-1-git-send-email-jezz@sysmic.org>
 <1418132813-32642-7-git-send-email-jezz@sysmic.org>
Message-ID: <20141227213814.60fe41d1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue,  9 Dec 2014 14:46:44 +0100, J?r?me Pouiller wrote:
>   - Move output selection to Config.in. It easier to add new
>     backends selection (wayland, directfb, ...).
>   - Remove useless build time dependencies xlib_libXdamage
>     and xlib_libXext (gpu-viv-bin-mx6q is provided as binary
>     package)

Then please adjust the Config.in file to indicate that those are
runtime dependencies only.

>   - Also create libraries symbolic links with version numbers.

Another thing I could suggest is to further split such a patch: you
have three items in your commit log, that are independent from each
other, so it is a good indication that the patch could be split.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
