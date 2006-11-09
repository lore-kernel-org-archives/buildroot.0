From: Will Newton <will.newton@gmail.com>
Date: Thu, 9 Nov 2006 13:07:43 +0000
Subject: [Buildroot] buildroot on Debian
In-Reply-To: <45532734.90006@computing.dundee.ac.uk>
References: <45532734.90006@computing.dundee.ac.uk>
Message-ID: <87a5b0800611090507i40fbacd9s99642d487e234039@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/9/06, Peter Mendham <petermendham@computing.dundee.ac.uk> wrote:
> I gave up on cygwin thinking that perhaps I was being an idiot, so I'm
> now trying Debian.  I'm certainly getting further now, however I hit
> another snag.  A completely fresh grab of buildroot from SVN this
> morning errors when trying to build busybox, the makefile says it is
> looking for Rules.mak in buildroot/build_powerpc/busybox/  Is this to do
> with the way I have configured things?  I don't understand what it is
> trying to accomplish.

This seems to be an issue with the svn snapshots of busybox. Try
deselecting "Use latest busybox snapshot" in the package
configuration.
