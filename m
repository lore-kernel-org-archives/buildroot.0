From: Dechesne, Nicolas <n-dechesne@ti.com>
Date: Fri, 6 Apr 2012 16:44:46 +0200
Subject: [Buildroot] customizing xorg package
In-Reply-To: <CAGmOteO=tp1o2cF7meTjX3G3ten7ARWept1jNv7ah7z6aa_9tA@mail.gmail.com>
References: <CALB96NmatmTxO=ZuOo_DVkw6bCBs19f9BuDDgWr_cSHn-OgE9g@mail.gmail.com>
 <CAGmOteO=tp1o2cF7meTjX3G3ten7ARWept1jNv7ah7z6aa_9tA@mail.gmail.com>
Message-ID: <CALB96Nm81X0kqk0kRPe+Ey+8LFoO4eh0Q4VpSVSsR7VCTGsYMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 6, 2012 at 6:36 AM, PHilip RUshik <prushik@gmail.com> wrote:

> I'm pretty sure it does build all the different components the same way
> that you would without buildroot. Look at the packages in
> buildroot/package/x11r7/ it should all be there, the libraries are prefixed
> with xlib_ If you want to change only the version, then just change it in
> buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk. It's
> pretty easy.
>

jeez... i am sorry about that... i was confused because the xserver version
is 1.7.5... and I thought it was the full X11R7.5 ;-) so you're right,
thanks for the quick answer!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120406/0c9653a2/attachment.html>
