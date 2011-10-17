From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Oct 2011 22:32:26 +0200
Subject: [Buildroot] [PATCH 2/9] Copy gdbserver from external toolchain
In-Reply-To: <1318603921-22899-3-git-send-email-will_wagner@carallon.com>
References: <1318603921-22899-1-git-send-email-will_wagner@carallon.com>
 <1318603921-22899-3-git-send-email-will_wagner@carallon.com>
Message-ID: <20111017223226.5638eac7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 14 Oct 2011 15:51:54 +0100,
Will Wagner <will_wagner@carallon.com> a ?crit :

> If you are using an external toolchain that includes gdb for host and gdbserver for target, this option will copy gdbserver onto the target.
> 
> Currently has support for ct-ng and codesourcery toolchains
> 
> Original idea by Anders Darander taken from http://comments.gmane.org/gmane.comp.lib.uclibc.buildroot/17747
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>

You should wrap the commit log (ditto for all your patches)

See also

 [PATCH 3/4] debug: provide an option to copy the gdbserver to the
 target

that I posted on July, 11th 2011.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
