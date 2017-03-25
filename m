From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 15:47:12 +0100
Subject: [Buildroot] Problem when $(PKG)_SOURCE does not contain
 $(PKG)_VERSION
In-Reply-To: <20170325143456.GA2470@itchy>
References: <20170325143456.GA2470@itchy>
Message-ID: <20170325154712.793f92be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Mar 2017 15:34:56 +0100, Eric Le Bihan wrote:

> Is there a way to fix this problem, by renaming the tarball in a
> post-download hook or using a hash verification trick?

Simply add a hash file, Buildroot will realize the hash is different
and re-download the tarball.

You can also poke upstream and tell them that unversioned tarballs is
horrible :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
