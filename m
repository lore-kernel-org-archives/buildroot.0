From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 12 Mar 2019 16:53:27 +0100
Subject: [Buildroot] why qt5webengine dependencies?
In-Reply-To: <0464fb6c-4e64-4608-611d-91d115a87fb0@ginzinger.com>
References: <0464fb6c-4e64-4608-611d-91d115a87fb0@ginzinger.com>
Message-ID: <0ea76fd6-6875-7433-3ac5-392db5bddf25@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12.03.19 11:21, Martin Kepplinger wrote:
> hi Gael,
> 


> * OpenGL backend:
> I'm yet to test this, but Qt webengine semms to support building with
> "no-opengl" since 5.8! And there's QT_WEBENGINE_DISABLE_GPU at runtime,
> so...


qt webengine indeed seems to need the "khr" opengl headers. Do you know
why and whether this could be a configuration bug in buildroot?

thanks,

                                 martin

-------------- next part --------------
A non-text attachment was scrubbed...
Name: smime.p7s
Type: application/x-pkcs7-signature
Size: 3616 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190312/410d995f/attachment.bin>
