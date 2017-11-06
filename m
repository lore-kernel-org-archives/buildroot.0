From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Nov 2017 13:11:19 +0100
Subject: [Buildroot] [PATCH] lxc: fix legacy PR_{G,
 S}ET_NO_NEW_PRIVS handling
In-Reply-To: <20171106084616.18282-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Mon, 6 Nov 2017 09:46:16 +0100")
References: <20171106084616.18282-1-peter@korsgaard.com>
Message-ID: <87fu9ry5co.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/841/841e9601a6afc023d2a303ffb4b7ea63edd816af/

 > The configure checks for these use AC_CHECK_DECLS, which define the symbol
 > to 0 if not available - So adjust the code to match. From the autoconf
 > manual:

 > https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/Generic-Declarations.html)

 > For each of the symbols (comma-separated list), define HAVE_DECL_symbol (in
 > all capitals) to ?1? if symbol is declared, otherwise to ?0?.

 > Patch submitted upstream: https://github.com/lxc/lxc/pull/1901

This has now been applied upstream.

Committed, thanks.

-- 
Bye, Peter Korsgaard
