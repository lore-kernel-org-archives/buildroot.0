From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 09 Jan 2009 11:47:16 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
In-Reply-To: <20090109112116.63cb1701@surf> (Thomas Petazzoni's message of
	"Fri\, 9 Jan 2009 11\:21\:16 +0100")
References: <20090108225832.382AD77108@busybox.osuosl.org>
	<87ljtkrg83.fsf@macbook.be.48ers.dk> <20090109112116.63cb1701@surf>
Message-ID: <87d4ewrc23.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Le Fri, 09 Jan 2009 10:17:16 +0100,
 Thomas> Peter Korsgaard <jacmet@uclibc.org> a ?crit :

 >> Why the extra dir? Why isn't mkimage just installed into
 >> STAGING_DIR/usr/bin and used from there?

 Thomas> I think we should stop mixing host and target binaries and
 Thomas> libraries in $(STAGING_DIR). But that's another story :-)

Agreed.

-- 
Bye, Peter Korsgaard
