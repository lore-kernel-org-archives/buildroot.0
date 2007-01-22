From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 22 Jan 2007 21:59:20 +0100
Subject: [Buildroot] Problem with revision 17357 missing .config.cmd?
In-Reply-To: <45B52343.1010503@lambsys.com>
References: <45B52343.1010503@lambsys.com>
Message-ID: <20070122205920.GA8610@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 22, 2007 at 02:49:07PM -0600, David Lambert wrote:
>I noticed that after checking out revision 17357 with the command:
>
>svn -r 17357 co svn://uclibc.org/trunk/buildroot
>
>The file .config.cmd appears to be missing. Is this a bug?
>
>I was using revision 17357 as I had wanted to work with a known release 
>which seemed to be stable for my purposes.

Current svn works fine for me.
.config.cmd is a generated file, it would be a bug if would be checked
into the repo..
