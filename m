From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2012 11:45:41 -0300
Subject: [Buildroot] [PATCH v3] New package: linux-firmware
In-Reply-To: <4F21610F.6070004@visionsystems.de>
References: <1327577414-11374-1-git-send-email-yegorslists@googlemail.com>
 <ad47d31d76e74e891bacdf8b9470a643@zacarias.com.ar>
 <8762fy4otk.fsf@macbook.be.48ers.dk>
 <7bd9330dcb162b6faa6e36e3e73f6b1e@zacarias.com.ar>
 <4F2158AA.1060508@visionsystems.de>
 <22c5d41b369800fbf0664afdc9da0f6f@zacarias.com.ar>
 <4F21610F.6070004@visionsystems.de>
Message-ID: <1a29218acbcfbcad43f6e75482d77477@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-01-26 11:19, Yegor Yefremov wrote:

> Thanks. I understand now.
>
> Another question: what to do with symlinks?
>
> rt3070.bin -> rt2870.bin
> rt3090.bin -> rt2860.bin
>
> Yegor

Keep them as symlinks, that's the reason i originally used cp rather 
than install, to keep them so.
There's no guarantee that the target filesystems dedups.
Regards.
