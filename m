From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 10 Feb 2009 13:55:40 +0100
Subject: [Buildroot] svn error : Connection refused
In-Reply-To: <1234269855.4559.97.camel@linux-l8en.site> (Sandeep Kumar's
	message of "Tue\, 10 Feb 2009 18\:14\:15 +0530")
References: <20090131204302.082727621A@busybox.osuosl.org>
	<1234269855.4559.97.camel@linux-l8en.site>
Message-ID: <8763ji5u43.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sandeep" == Sandeep Kumar <sandeepk@verismonetworks.com> writes:

 Sandeep> Hi all
 Sandeep> I am trying to checkout a fresh copy of buildroot by following command

 Sandeep> 	"svn co svn://uclibc.org/trunk/buildroot"

 Sandeep> and getting the following error
 Sandeep> svn: Can't connect to host 'uclibc.org': Connection refused
 Sandeep> My internet connection is working fine and i am able to access
 Sandeep> "uclibc.org". Can antbody help me out to sort out this problem.

You probably have a firewall blocking the svn connections. Use the
-rc4 release of the latest svn snapshot.

-- 
Bye, Peter Korsgaard
