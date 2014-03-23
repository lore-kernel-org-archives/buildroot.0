From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Mar 2014 23:25:53 +0100
Subject: [Buildroot] [PATCH v2.1] package/ncurses: Remove duplicated
	library install code
In-Reply-To: <1394596445.582508.750063666658.1.gpush@pablo> (Jeremy Kerr's
 message of "Wed, 12 Mar 2014 11:54:05 +0800")
References: <1394596445.582508.750063666658.1.gpush@pablo>
Message-ID: <87lhw0tuvi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jeremy" == Jeremy Kerr <jk@ozlabs.org> writes:

 > Currently, the ncurses package conditionally defines macros to install
 > the panel, form and menu libraries. This means we duplicate the install
 > step for each library type.

 > Rather than defining a set of macros, this change introduces a variable
 > for the set of installed libraries, $(NCURSES_LIBS-y). We use this in a
 > single macro to perform the library installation in one place.

 > Based on a change suggested by Thomas Petazzoni
 > <thomas.petazzoni@free-electrons.com>.

 > Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

 > ---
 > v2.1: Fix NCURSES_INSTALL_TARGET_PROGS deletion

Committed, thanks.

-- 
Bye, Peter Korsgaard
