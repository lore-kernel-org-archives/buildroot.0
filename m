From: Claas Hilbrecht <claas+maillinglists.buildroot@jucs-kramkiste.de>
Date: Fri, 27 Jul 2007 12:53:10 +0200
Subject: [Buildroot] SVN Rev 19269 won't build
In-Reply-To: <20070727103757.GC22789@aon.at>
References: <5041A110D5D200EDF64E7756@[192.168.83.121]>
	<20070727103757.GC22789@aon.at>
Message-ID: <09E61CA94D6C4DE241DF8A46@[192.168.83.121]>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--Am Freitag, 27. Juli 2007 12:37 +0200 Bernhard Fischer 
<rep.dot.nop@gmail.com> schrieb:

>> just a note. The svn version 19269 won't build (on Debian etch). And not
>> somewhere deep inside but at a very early stage.
>
> Do you have libncurses5-dev installed?

Yes. See yourself:

babel at eisler:~$ dpkg -l | grep libncurses5-dev
ii  libncurses5-dev                  5.5-5 
Developer's libraries and docs for ncurses

A kernel make menuconfig e.g. works fine.

-- 
 Claas Hilbrecht
 http://www.jucs-kramkiste.de
