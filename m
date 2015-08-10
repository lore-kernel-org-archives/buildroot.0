From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 10 Aug 2015 16:34:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/poco: bump to version 1.6.1
In-Reply-To: <20150810162227.6a3cde19@free-electrons.com>
References: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
 <20150810162227.6a3cde19@free-electrons.com>
Message-ID: <1439217249.5186.18.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Mo, 2015-08-10 at 16:22 +0200, Thomas Petazzoni wrote:
> Dear J?rg Krause,
> 
> On Tue,  4 Aug 2015 11:57:27 +0200, J?rg Krause wrote:
> > Also:
> >   * switch from sourceforge to github
> >   * remove hash (github-helper)
> 
> You should have actually removed the hash file entirely, so I've done
> that and applied to the next branch.

In that case I do not understand the help text from
nightly.buildroot.org, 17.4. The .hash file:

"The none hash type is reserved to those archives downloaded from a
repository, like a git clone, a subversion checkout? or archives
downloaded with the github helper Section 17.19.2, ?How to add a 
                    ^^^^^^^^^^^^^
package from GitHub?."

And from the example:
"# No hash for 1234, comes from the github-helper:
none   xxx                                                             
 libfoo-1234.tar.gz"

Best regards
J?rg Krause
