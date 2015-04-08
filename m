From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Apr 2015 00:31:26 +0200
Subject: [Buildroot] [PATCH v5 1/1] tovid: new package
In-Reply-To: <5525A881.3000404@ou.edu>
References: <1427038513-5368-1-git-send-email-skenton@ou.edu>
 <20150405114514.355707a4@free-electrons.com>
 <5525A881.3000404@ou.edu>
Message-ID: <20150408223126.GL4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Steve, All,

On 2015-04-08 17:15 -0500, Steve Kenton spake thusly:
> <snip>
> On 04/05/2015 04:45 AM, Thomas Petazzoni wrote:
> > 
> > Applied, with some minor changes:
> > 
> >     Thomas
> It looks like Tovid has finished moving from SVN to github.

Great! :-)

> Github Green "Latest release" button for Tovid shows:
> 
> https://github.com/tovid-suite/tovid/releases/download/v0.35.0/tovid-0.35.0.tar.gz
> 
> I could not find any indication of a hash file - does github offer them anywhere
> that I'm missing?

No, GitHub does not provide hashes of tarballs.

> Computed the one below locally after downloading. Is sha256sum
> still preferred hash for local computation?

Yes, computing it is fine; sha256 is good.

> $ sha256sum tovid-0.35.0.tar.gz
> 06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz

So, you'd add this hash as thus in the .hash file:

    # Locally computed:
    sha256  06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz

> Are uploaded tarballs still preferred for projects on github?

Yes. See:

    http://buildroot.net/downloads/manual/manual.html#github-download-url

Quoting:

    If there is a release tarball uploaded by the maintainer, we prefer
    to use that [...]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
