From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 19:39:10 +0100
Subject: [Buildroot] [lua V3 4/8] luajit: add host variant
In-Reply-To: <20140301174721.GB3354@free.fr>
References: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
 <1393694590-29945-5-git-send-email-francois.perrad@gadz.org>
 <20140301174721.GB3354@free.fr>
Message-ID: <20140301193910.369c3cdd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 1 Mar 2014 18:47:21 +0100, Yann E. MORIN wrote:

> I'm really worried about how this is gonna play with the virtual-package
> insfrastructure curently pending.
> 
> On one hand, I'd like the virtual-package infra to go in first (hey! I
> wrote it! ;-) ), since I'm not very versed in this lua stuff (but you
> are), and we currently have no host virtual packages. But that would
> put the burden onto you to rebase your series.
> 
> On the other hand, sicne you're introducing host virtual packages, we
> may want to have them in before the virtual-package infra, so we get a
> pretty good idea of what is actually required.
> 
> So, whatever... Let's see what Thomas (deputy-maintainer while Peter's
> on vacation) will say about this. Thomas? ;-)

While in general I prefer to merge things as soon as possible, and then
improve on top of it later on, in this case, I believe it would be nice
if the virtual package infra could from the beginning support the host
package case since we know we will need it for the Lua stuff.

Yann, you could just test it with some simple dummy host packages to
ensure that your virtual infra works for host packages, and leave it to
Fran?ois to rebase his series on top of the infra once it has been
merged.

How does it sounds?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
