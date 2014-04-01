From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 1 Apr 2014 21:11:14 +0200
Subject: [Buildroot] [PATCH 0/6] Add virtual package for full-openGL
 (branch yem/fixes)
In-Reply-To: <cover.1396302677.git.yann.morin.1998@free.fr>
References: <cover.1396302677.git.yann.morin.1998@free.fr>
Message-ID: <20140401191114.GA2396@milhouse>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E., Bernd,
On Mon, Mar 31, 2014 at 11:59:57PM +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Hello All!
>
> This series introduces a virtual package for full-openGL providers.
Thanks for your work on this. I am using it to add support for CoGL/Clutter to
Buildroot (wraps opengl, gles, egl, with/without x11/wayland). Now I can build
it for Qemu/x86 and Raspberry :-)

Best regards,
ELB

(https://github.com/elebihan/buildroot/tree/clutter-support)
