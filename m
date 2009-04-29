From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 29 Apr 2009 16:34:00 +0200
Subject: [Buildroot] HEADS UP: svn->git transition
In-Reply-To: <49F85AF3.4060501@t-online.de>
References: <20090429113849.GB18534@mx.loc> <49F85AF3.4060501@t-online.de>
Message-ID: <20090429143400.GC18534@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 29, 2009 at 02:49:39PM +0100, Bernd Schmidt wrote:
> Bernhard Reutner-Fischer wrote:
>
>> We will be switching to git (instead of svn) for our repositories.
>
> Any particular reason?

I've asked a couple of folks and they too found git easier to use.
Benefits in my POV include:
- bisect. Makes it easy to track down a regression
- easier merging between a couple of branches
- convenient git-am to apply patches from email
etc.

> As far as I know, git works on local repositories.  How will we get  
> things committed into a mainline repository?

git push -v --thin git+ssh://$USERNAME at uclibc.org/srv/git/uClibc.git
Paths will differ a bit, i will update the developer instructions on the
webpage accordingly.
