From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 May 2010 08:46:06 +0200
Subject: [Buildroot] Graphing package dependencies
In-Reply-To: <20100513202107.1b8bfcf3@surf> (Thomas Petazzoni's message of
	"Thu, 13 May 2010 20:21:07 +0200")
References: <20100506101437.5e35c795@surf> <20100513202107.1b8bfcf3@surf>
Message-ID: <8739xr2fgx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> I've slightly improved this script, and it is now capable of generating
 Thomas> the dependency graph for a full Buildroot configuration, i.e taking
 Thomas> into account all packages that have been selected.

 Thomas> See http://free-electrons.com/~thomas/buildroot-full-dependencies.pdf
 Thomas> for a fairly large example involving X.org and Gtk.

 Thomas> As always, the code is available in
 Thomas> http://git.buildroot.net/~tpetazzoni/git/buildroot/log/?h=graph-dependencies.
 Thomas> Besides the modifications in the script itself, the modifications in
 Thomas> the rest of Buildroot are very small.

Great! Care to write a bit of documentation about it, then I'll pull it?

-- 
Bye, Peter Korsgaard
