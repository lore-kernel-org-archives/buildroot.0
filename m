From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 16 Jun 2009 15:40:39 +0200
Subject: [Buildroot] [PATCH] iptables: use multipurpose binaries
In-Reply-To: <20090616112441.47d6b67c@bandomeer.europe.flane.local>
References: <20090616112441.47d6b67c@bandomeer.europe.flane.local>
Message-ID: <20090616134039.GA9914@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 16, 2009 at 11:24:41AM +0200, Olaf Rempel wrote:
>Let iptables use the *-multi binaries:

Sounds good. Does it build now with IPv6 disabled and how much difference is
a pure ipv4 versus v4+v6 size() wise?
