From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 22 Jul 2008 21:57:28 -0600
Subject: [Buildroot] svn commit: trunk/buildroot/package/which
In-Reply-To: <20080723005004.GC11904@cloud.net.au>
References: <20080722135936.23DC43C70D@busybox.net>
	<20080723005004.GC11904@cloud.net.au>
Message-ID: <1216785448.15083.3.camel@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2008-07-23 at 10:50 +1000, Hamish Moffatt wrote:
> On Tue, Jul 22, 2008 at 06:59:36AM -0700, jacmet at uclibc.org wrote:
> > Author: jacmet
> > Date: 2008-07-22 06:59:35 -0700 (Tue, 22 Jul 2008)
> > New Revision: 22913
> > 
> > Log:
> > which: needs readline
> 
> What does this package do that busybox's which doesn't?

berrier:/home/wberrier # which --help
Usage: which [options] [--] programname [...]
Options: --version, -[vV] Print version and exit successfully.
         --help,          Print this help and exit successfully.
         --skip-dot       Skip directories in PATH that start with a
dot.
         --skip-tilde     Skip directories in PATH that start with a
tilde.
         --show-dot       Don't expand a dot to current directory in
output.
         --show-tilde     Output a tilde for HOME directory for
non-root.
         --tty-only       Stop processing options on the right if not on
tty.
         --all, -a        Print all matches in PATH, not just the first
         --read-alias, -i Read list of aliases from stdin.
         --skip-alias     Ignore option --read-alias; don't read stdin.
         --read-functions Read shell functions from stdin.
         --skip-functions Ignore option --read-functions; don't read
stdin.


I'm not sure which of those options busybox's 'which' supports.

Wade
