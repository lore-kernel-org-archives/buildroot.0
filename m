From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 May 2020 22:44:16 +0200
Subject: [Buildroot] [PATCH 1/3] package/sdl2: enable SSE only if it's
 supported by the target
In-Reply-To: <70CE52ED-932A-4109-89E1-910C2C447846@gmail.com>
References: <20200515175357.45954-1-nrosfs@gmail.com>
 <20200515214840.7327bb1b@windsurf.home>
 <70CE52ED-932A-4109-89E1-910C2C447846@gmail.com>
Message-ID: <20200515224416.7443c5b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 May 2020 21:55:38 +0200
Nicolas Robin <nrosfs@gmail.com> wrote:

> I do! Pentium MMX 233MHz, a beast!

But a Pentium MMX does not have 3DNow.

And anyway, you're using Buildroot to build a system for a Pentium MMX
at 233 Mhz ? These machines are still running and alive ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
