From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 22 Mar 2017 22:21:08 +0100
Subject: [Buildroot] [RFC 0/3] Qt WebEngine support
In-Reply-To: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
Message-ID: <20170322222108.397d2af6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Wed, 22 Mar 2017 14:13:28 -0400, Ga?l PORTAY <gael.portay@savoirfairelinux.com> wrote:

[...]
> 
> Note: I do not know yet how to add an input backend (mouse, keyboard). For now,
> quicknanobrowser will just display the qt website.
> 
[...]'

Change System configuration --> /dev management to 'devtmpfs + eudev' (untested),
or use 'Init System (systemd)' (tested), both enable udev support needed by the
qt5 default input system...

Regards,
Peter
