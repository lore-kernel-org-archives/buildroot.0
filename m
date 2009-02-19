From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 19 Feb 2009 16:34:03 +0100
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <d6cda7730902171256y335886b6xb2924e2e69aa1c44@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Tue\, 17 Feb 2009
	17\:56\:19 -0300")
References: <49907BAE.3020509@ethertek.ca>
	<d6cda7730902091413h5e7cbd21ra41d7154ca60909e@mail.gmail.com>
	<49922B53.50608@ethertek.ca>
	<d6cda7730902171256y335886b6xb2924e2e69aa1c44@mail.gmail.com>
Message-ID: <873aeaa1as.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 Thiago>    svn merge svn://uclibc.org/trunk/buildroot -rupstream.rev:HEAD

 Thiago>    Seams to work much, much better, and you get --dry-run to see will
 Thiago> be the merge result :)

 Thiago>    Please, notice again that there might be better methods. I tried to
 Thiago> locate the script Peter mentioned, but I couldn't get it to be
 Thiago> installed in my gentoo distro :(
 Thiago>    But svn merge seams to be doing what the perl script does.

You can grab it from subversion svn:

http://svn.collab.net/repos/svn/trunk/contrib/client-side/svn_load_dirs/

-- 
Bye, Peter Korsgaard
