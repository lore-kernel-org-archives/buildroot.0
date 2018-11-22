From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Nov 2018 00:27:05 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-21
In-Reply-To: <20181122070027.B388420D31@mail.bootlin.com>
References: <20181122070027.B388420D31@mail.bootlin.com>
Message-ID: <e0ab8c2f-dd85-c4b2-b15c-6273c9d60264@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/11/2018 08:00, Thomas Petazzoni wrote:
>      powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/42023c8d9798a8c3b79a3b7f899587ba83ad37f8 | ORPH
>      powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/c0fcab923518aaa2739be416fed0dff42c522453 | ORPH
>      powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/86916c9c94ffa925f358388ed065ab991327fef7 | ORPH

 This has been failing (with an ICE) since we switched to GCC 7 as the default
internal toolchain. I had a really quick look through the GCC buglist but found
nothing obvious.

 Any takers?

 Regards,
 Arnout
