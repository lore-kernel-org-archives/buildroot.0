From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 24 Jul 2007 14:34:33 +0200
Subject: [Buildroot] config update
In-Reply-To: <469C604E.5060703@cs.helsinki.fi>
References: <469C604E.5060703@cs.helsinki.fi>
Message-ID: <20070724123433.GA18856@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 17, 2007 at 09:23:10AM +0300, Heikki Lindholm wrote:
>Hello,
>
>I just updated my OS X buildroot and, recent changes breaking it, I have 

Can you please be more specific as to how it broke?
TIA,

>to ask, why was packages/config updated? It worked just fine - even on 
>OS X - before the bump to linux 2.6.21* config system. Were there 
>features missing from the old version or something?

The i18n support was basically not working right. Apart from better
colour-handling (vie the respective env vars, see source) this was about
the only reason for the update. As to the libintl breakage, please refer
to several bug-reports in the bugtracker.

As said above, please show me what broke so we can fix it up for good.
