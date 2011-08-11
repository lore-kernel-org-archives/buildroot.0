From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 11 Aug 2011 19:34:37 +0200
Subject: [Buildroot] [PATCH] directfb: bump to version 1.4.13
In-Reply-To: <C2A5D1386C6DB94198F2A5C8368EAE6C143B59F0@DULMEX02.barco.com>
References: <C2A5D1386C6DB94198F2A5C8368EAE6C143B59F0@DULMEX02.barco.com>
Message-ID: <1313084078.12036.12.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-08-11 at 12:51 -0400, Fei, Yiyang wrote:
> The newest release of directfb is actually 1.5.3.  Is there a specific
> reason you need to stick with 1.4.x?  V1.5.3 also has build issues due
> to ARM v6 instructions which are not supported on my processor.  I'm
> working with directfb to resolve it.

I understood that 1.4.x is still the latest stable branch and that 1.5.x
is an unstable development branch. And as far as I know 1.4.13 is the
latest version that will cross-compile w/o problems.


Sven
