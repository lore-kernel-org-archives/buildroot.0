From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:30:01 +0200
Subject: [Buildroot] [PATCH v3 1/1] fcgiwrap: Disable -Werror in CFLAGS
	set by configure.
In-Reply-To: <20170619162605.30831-2-thomas.claveirole@green-communications.fr>
 (Thomas Claveirole's message of "Mon, 19 Jun 2017 18:26:05 +0200")
References: <20170619162605.30831-1-thomas.claveirole@green-communications.fr>
 <20170619174032.4f597cb2@windsurf.lan>
 <20170619162605.30831-2-thomas.claveirole@green-communications.fr>
Message-ID: <87d19rk8eu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Claveirole <thomas.claveirole@green-communications.fr> writes:

 > Thus, fix
 > http://autobuild.buildroot.net/results/8e0/8e04bf5a85ecd7f120bc9dedeedc891def6c46c1/

 > fcgiwrap's configure script appends -Werror to AM_CFLAGS, then use it
 > to build the package.  This is an issue when Buildroot supports a new
 > compiler version and this version makes some warnings appear.
 > Luckily, one can provide CFLAGS=-Wno-error to the configure script so
 > it appends -Wno-error to AM_CFLAGS.

 > Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
