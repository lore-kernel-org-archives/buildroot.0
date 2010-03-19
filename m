From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Fri, 19 Mar 2010 18:48:02 +0200
Subject: [Buildroot] Xorg configuration for XGI chip
In-Reply-To: <4BA3A72B.3010009@terawatt.fr>
References: <4BA3A72B.3010009@terawatt.fr>
Message-ID: <4BA3AAC2.9050400@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2010 06:32 PM, Damien Borie wrote:
> Hi.
>
> I have to configure my Xorg X server to use a XGI Volari z9s chip. I'm
> not very familiar with this and all I tried for now only make a black
> screen.
> I tried to use XGI driver from Buildroot, SIS driver from Buildroot, and
> tried to install XGIZ driver downloaded from XGI website, but it's not
> working.
> I think I must insist with one of these drivers but I don't know which
> one really works.

[...]

> The errors don't seems to be important as I don't use 3D and OpenGL.

I get similar errors with Intel GPU and it works OK.

> If someone has already work on this chip XGI z9s, which driver must be
> used and how to configure it?

I have almost no experience with XGI... But can you try latest buildroot
from git or just download daily snapshot. There was massive X11 update.

> Thanks,
> Damien.
