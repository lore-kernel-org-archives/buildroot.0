From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 20 Mar 2007 16:34:43 +0100
Subject: [Buildroot] Location of Cross-Compiled Kernel Tree
In-Reply-To: <61c0054e0703200754j7c355f6dqa0831f9458e68e78@mail.gmail.com>
References: <61c0054e0703200754j7c355f6dqa0831f9458e68e78@mail.gmail.com>
Message-ID: <20070320153443.GA22863@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 20, 2007 at 09:54:57AM -0500, Paul Kavan wrote:
>Hello all:
>
>Sorry if this seems like a basic question. I am trying to port a usb
>wifi driver to the AT91SAM9260 and for the make file I need to specify
>the kernel directory. For that I need the top level of the
>cross-compiled kernel tree that buildroot makes. I am using a very
>recent version of buildroot....literally days old. Does anyone know
>what directory that is exactly?

depends..

echo *build_*/linux-*

and pick the correct one (there may only be one).
