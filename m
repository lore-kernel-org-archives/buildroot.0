From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Mar 2015 18:00:15 +0100
Subject: [Buildroot] [V2 2/2] graph-depends: add an option
 --stop-on-virtual
In-Reply-To: <20150314162657.GA4009@free.fr>
References: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
 <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
 <20150308221843.2d6fbf7d@free-electrons.com>
 <CAB0FRsvxotGUKRC2q7R_JKPCajZb68X3r2qnjciehP-cqXENBg@mail.gmail.com>
 <20150309211508.39c2a0ac@free-electrons.com>
 <20150314162657.GA4009@free.fr>
Message-ID: <20150314180015.50705689@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 14 Mar 2015 17:26:57 +0100, Yann E. MORIN wrote:

> What about something like:
> 
>     BR2_GRAPH_DEPS_OPTS='--stop-on PKGS' make graph-depends
> 
> where 'PKGS' would be a comma-separated list of packages, possibly a
> glob or regexp, or even the keyword 'virtual' to stop on virtual
> packages?

Sounds like a good idea to me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
