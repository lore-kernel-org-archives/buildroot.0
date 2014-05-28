From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 May 2014 00:03:31 +0200
Subject: [Buildroot] [PATCH v3 for-2014.05] manual: remove contributor
	list and add copyright
In-Reply-To: <7ccc79e730c982d53177.1401298191@argentina> (Thomas De
 Schampheleire's message of "Wed, 28 May 2014 19:29:51 +0200")
References: <7ccc79e730c982d53177.1401298191@argentina>
Message-ID: <8738ftblxo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 > As discussed on the mailing list [1], remove the limited explicit list of
 > contributors in favor of the general mention of 'The Buildroot developers'.
 > Add a copyright statement.
 > Move the generation info to the front.

 > [1] http://lists.busybox.net/pipermail/buildroot/2014-May/097589.html

 > Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 > ---
 > v3: dammit, remove for real now, sorry.
 > v2: remove accidental changes to manual.mk

 >  docs/manual/manual.txt |  11 +++++------
 >  1 files changed, 5 insertions(+), 6 deletions(-)

 > diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
 > --- a/docs/manual/manual.txt
 > +++ b/docs/manual/manual.txt
 > @@ -4,16 +4,15 @@
 >  = The Buildroot user manual
 >  :toc:
 
 > -Buildroot usage and documentation by Thomas Petazzoni. Contributions
 > -from Karsten Kruse, Ned Ludd, Martin Herren and others.
 > +Buildroot {sys:echo $\{BR2_VERSION%%-git*\}} manual generated on {localdate}
 > +{localtime} from git revision {sys:git rev-parse --short HEAD}
 
 > -The Buildroot manual is licensed under the GNU General Public License,
 > -version 2. Refer to file
 > +The Buildroot manual is written by the Buildroot developers. +

This trailing '+' seems wrong. I've removed it.

 > +It is licensed under the GNU General Public License, version 2. Refer to file
 >  http://git.buildroot.org/buildroot/tree/COPYING[COPYING] in the Buildroot

I've changed this to 'Refer to the COPYING file'.

Committed with these minor changes, thanks.

-- 
Bye, Peter Korsgaard
