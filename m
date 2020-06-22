From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:34:36 +0200
Subject: [Buildroot] [PATCH v2] package/cegui: select libglu when libgl
 is detected
In-Reply-To: <dc148604-f0c8-112b-fb4e-ce273297e2ef@grinn-global.com>
References: <20200621131832.1036346-1-b.bilas@grinn-global.com>
 <20200622211010.64d5fb7f@windsurf.home>
 <8023dcfc-b52e-0c9b-5221-c6f1c201c7cf@grinn-global.com>
 <20200622220133.0e142645@windsurf.home>
 <dc148604-f0c8-112b-fb4e-ce273297e2ef@grinn-global.com>
Message-ID: <20200622223436.4d3016f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 22 Jun 2020 22:11:31 +0200
Bartosz Bilas <b.bilas@grinn-global.com> wrote:

> I agree with you now, so basically we have to select glu only when glew 
> is used and that should solve the problem discussed...

See the solution I have proposed: to be more explicit about which
OpenGL loader is used. See my initial reply.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
