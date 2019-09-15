From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 22:52:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: python support needs
 .py modules
In-Reply-To: <fbe7bcf6-4e5c-cb48-12f5-57c60ab49b1e@mind.be>
References: <20190905184403.19368-1-fontaine.fabrice@gmail.com>
 <2ab3c932-a8d0-b682-18d1-552b5ccb81d6@mind.be>
 <20190913221007.74731262@windsurf.home>
 <fbe7bcf6-4e5c-cb48-12f5-57c60ab49b1e@mind.be>
Message-ID: <20190915225256.268d2708@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Sep 2019 19:18:29 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I agree that this approach is insanely and needlessly complicated. However, do
> we really want to produce a pretty large package patch to simplify this, which
> is probably not even upstreamable because it would break existing installations
> that have overridden config.py?

I don't think it is meant to be overridden. It's installed in /usr, it's
not a configuration file.

Another approach would be to see if it's possible to achieve the same,
but using a .pyc file, like using "import" or something like this ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
