From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Oct 2012 00:49:48 +0200
Subject: [Buildroot] [PATCHv7 1/5] pkgconf: new package
In-Reply-To: <1351109444-3301-1-git-send-email-gustavo@zacarias.com.ar>
References: <1351109444-3301-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20121025004948.11042c07@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 24 Oct 2012 17:10:44 -0300, Gustavo Zacarias wrote:
> pkgconf is a drop-in replacement for pkg-config that doesn't need
> itself to build and just requires a C89 compiler.
> 
> Instead of using a patch for hardcoded sysroot support (as the patch to
> pkg-config does) we rely instead on a wrapper script that takes the
> appropiate action.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
