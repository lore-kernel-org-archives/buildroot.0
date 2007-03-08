From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 8 Mar 2007 11:36:26 +0100
Subject: [Buildroot] target busybox skeleton.
In-Reply-To: <20070218173211.GA31717@zelow.no>
References: <20070218173211.GA31717@zelow.no>
Message-ID: <20070308103626.GB31261@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 18, 2007 at 06:32:11PM +0100, Thomas Lundquist wrote:
>Maybe it's a bit too tiny?
>
>I'd suggest that /usr/lib is added.

hmz. And what if i don't have anything in /usr/lib? Wasted dentry.

What about switching to "install -D" instead, where appropriate?
>(it hit me when building libpng.)
