From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Aug 2016 18:45:49 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/x11r7/xserver_xorg-server:
 needs dri/dri2/dri3 for libdrm support
References: <1470585874-15428-1-git-send-email-bernd.kuhls@t-online.de>
 <20160811000512.186a9343@free-electrons.com>
Message-ID: <t2b18dxcgn.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 11 Aug 2016 00:05:12 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Sun,  7 Aug 2016 18:04:34 +0200, Bernd Kuhls wrote:
>> Rework dependency handling as pointed out by Thomas:
>> http://lists.busybox.net/pipermail/buildroot/2016-July/168433.html
>> 
>> Fixes
>> http://autobuild.buildroot.net/results/2d3/2d38637e7904f3e382e41745a82ee1a1cf19ba71/
>> 
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> Could you verify if this issue still exists? Indeed, since the bump
> from 1.18.3 to 1.18.4 of the X.org server, we were missing one patch.

Hi Thomas,

re-adding the missing patch solved the problem, I could not
reproduce the build error anymore.

Regards, Bernd
