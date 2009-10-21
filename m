From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 Oct 2009 00:10:08 +0200
Subject: [Buildroot] x86_64-linux-uclibc-gcc not found
In-Reply-To: <4ADE7E4E.1020606@renta.net> (Mark Constable's message of "Wed\,
	21 Oct 2009 13\:21\:50 +1000")
References: <4ADE7E4E.1020606@renta.net>
Message-ID: <878wf4pfen.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Constable <markc@renta.net> writes:

 Mark> This is using 2009-08 instead of Git, same problem for a x86_64 target.
 Mark> Minimal selections and a make O=/home/br200908

 Mark> ( cd extra/locale/; wget --passive-ftp http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz )
 Mark> --2009-10-21 05:22:25--  http://www.uclibc.org/downloads/uClibc-locale-20081111-64-el.tgz
 Mark> Resolving www.uclibc.org... 140.211.167.224
 Mark> Connecting to www.uclibc.org|140.211.167.224|:80... connected.
 Mark> HTTP request sent, awaiting response... 404 Not Found
 Mark> 2009-10-21 05:22:27 ERROR 404: Not Found.

 Mark> make[1]: *** [extra/locale/uClibc-locale-20081111-64-el.tgz] Error 8

Don't select BR2_ENABLE_LOCALE_PREGENERATED, the uclibc people still
haven't made a suitable tarball available.

-- 
Bye, Peter Korsgaard
