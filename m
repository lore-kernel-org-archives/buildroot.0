From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 23 Jul 2008 14:14:12 +1000
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
In-Reply-To: <1216785448.15083.3.camel@berrier.lan>
References: <20080722135936.23DC43C70D@busybox.net>
	<20080723005004.GC11904@cloud.net.au>
	<1216785448.15083.3.camel@berrier.lan>
Message-ID: <20080723041412.GA16743@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 22, 2008 at 09:57:28PM -0600, Wade Berrier wrote:
> On Wed, 2008-07-23 at 10:50 +1000, Hamish Moffatt wrote:
> > On Tue, Jul 22, 2008 at 06:59:36AM -0700, jacmet at uclibc.org wrote:
> > > Author: jacmet
> > > Date: 2008-07-22 06:59:35 -0700 (Tue, 22 Jul 2008)
> > > New Revision: 22913
> > > 
> > > Log:
> > > which: needs readline
> > 
> > What does this package do that busybox's which doesn't?
> 
> berrier:/home/wberrier # which --help
> Usage: which [options] [--] programname [...]

> Options: --version, -[vV] Print version and exit successfully.
>          --help,          Print this help and exit successfully.
>          --skip-dot       Skip directories in PATH that start with a
> dot.
>          --skip-tilde     Skip directories in PATH that start with a
> tilde.
>          --show-dot       Don't expand a dot to current directory in
> output.
>          --show-tilde     Output a tilde for HOME directory for
> non-root.
>          --tty-only       Stop processing options on the right if not on
> tty.
>          --all, -a        Print all matches in PATH, not just the first
>          --read-alias, -i Read list of aliases from stdin.
>          --skip-alias     Ignore option --read-alias; don't read stdin.
>          --read-functions Read shell functions from stdin.
>          --skip-functions Ignore option --read-functions; don't read
> stdin.

Wow. busybox's version doesn't have any of that, and neither does zsh's.
debian's debianutils version only has -a.

Very fancy. I can't imagine ever wanting most of those features - which
is meant to show you which command is being run, to skipping aliases and
parts of your $PATH doesn't seem very useful.

Anyway, thanks for the info.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
