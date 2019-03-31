From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:33:11 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/jq: add oniguruma optional dependency
In-Reply-To: <CAPi7W82rGMuVdjVtgS2DbuqoFg2RWtU5YYembKoXiBot3P=01Q@mail.gmail.com>
References: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
 <20190320203617.27496-2-fontaine.fabrice@gmail.com>
 <20190331151432.52efa3b8@windsurf>
 <CAPi7W82rGMuVdjVtgS2DbuqoFg2RWtU5YYembKoXiBot3P=01Q@mail.gmail.com>
Message-ID: <20190331153311.6298e214@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 31 Mar 2019 15:27:38 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > What decided you to add onigurama as a mandatory dependency for
> > host-jq ? What feature does it bring ? Do we really need it as a
> > mandatory dependency ?  
> I decided to keep it because it's enabled by default in upstream but I
> can send a v2 without it as no package depends on this feature.

We normally try to keep the dependencies as minimal as possible, so
until we have a use-case for this, I'd prefer to not have this
dependency for the host variant.

This means the onigurama package should only add a target variant.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
