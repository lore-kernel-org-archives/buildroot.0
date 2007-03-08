From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Thu, 08 Mar 2007 13:14:40 +0200
Subject: [Buildroot] target busybox skeleton.
In-Reply-To: <20070308103626.GB31261@aon.at>
References: <20070218173211.GA31717@zelow.no> <20070308103626.GB31261@aon.at>
Message-ID: <45EFF020.2020406@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer kirjoitti:
> On Sun, Feb 18, 2007 at 06:32:11PM +0100, Thomas Lundquist wrote:
> 
>>Maybe it's a bit too tiny?
>>
>>I'd suggest that /usr/lib is added.
> 
> 
> hmz. And what if i don't have anything in /usr/lib? Wasted dentry.
> 
> What about switching to "install -D" instead, where appropriate?

If doing major changes, please consider taking portability issues into 
account. In this case, "-D" isn't supported on OS X.

-- Heikki Lindholm
