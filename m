From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Aug 2020 23:18:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/lttng-tools: fix build with musl
In-Reply-To: <CAB4xu_2sQ0U2JPsujSXnup1waHJiFo0WM2LyBfT-uKMO90gSfw@mail.gmail.com>
References: <20200817201335.3767619-1-fontaine.fabrice@gmail.com>
 <CAB4xu_2sQ0U2JPsujSXnup1waHJiFo0WM2LyBfT-uKMO90gSfw@mail.gmail.com>
Message-ID: <20200817231848.3015a6fc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Aug 2020 16:26:54 -0400
Philippe Proulx <eeppeliteloop@gmail.com> wrote:

> Why is this only an error with musl?
> 
> Would you mind submitting this to upstream too?

It is already upstream, it's mentioned in the patch from Fabrice:

+[Retrieved from:
+https://github.com/lttng/lttng-tools/commit/73f906d4d6806afb1962751ccb0fe6c15f320d94]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
