From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 01 Jun 2008 22:34:23 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package: database
	database/mysql_client
In-Reply-To: <17D35AC9-FC86-45C6-90AE-874D275697F3@valka.is> (Arnar Mar Sig's
	message of "Sun\, 1 Jun 2008 19\:35\:14 +0000")
References: <20080601180849.37DEE3C814@busybox.net>
	<87abi5klws.fsf@macbook.be.48ers.dk>
	<17D35AC9-FC86-45C6-90AE-874D275697F3@valka.is>
Message-ID: <87lk1oj3n4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnar" == Arnar Mar Sig <antab@valka.is> writes:

Hi,
 antab> +endmenu
 >> 
 >> The other sub menus use menuconfig instead of menu, please do as well.
 Arnar> Sorry about that, fixed

No problem, but please do commit the fix (you don't seem to have done
that yet).

 >> Please don't add the version number to the help text.
 Arnar> Removed from the helptext, Keeping it in the menu text, There are so
 Arnar> many changes between the 4.x - 5.x versions that one needs to know the
 Arnar> major version number.

The maybe simply call it MYSQL5 or 5.x ?

 >> Is that the official download URL?
 Arnar> This mirror was found after searching the mysql.com site.

Ok, I don't really know much about mysql, just seemed odd.

-- 
Bye, Peter Korsgaard
