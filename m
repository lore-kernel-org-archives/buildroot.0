From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Fri, 20 Jun 2008 10:40:22 +0200
Subject: [Buildroot] GIT or SVN
In-Reply-To: <20080620083646.GB12682@mx.loc>
References: <485A3396.80701@cetrtapot.si> <87iqw5dyyb.fsf@macbook.be.48ers.dk>
	<20080620083646.GB12682@mx.loc>
Message-ID: <485B6CF6.7040901@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Thu, Jun 19, 2008 at 09:09:00PM +0200, Peter Korsgaard wrote:
>>>>>>> "Hinko" == Hinko Kocevar <hinko.kocevar@cetrtapot.si> writes:
>> Hinko> Hello,
>> Hinko> I'm new to the uclibc buildroot. I've noticed that there are
>> Hinko> two repositories: GIT and SVN. GIT looks more up2date. Is GIT
>> Hinko> the tree to use?
>>
>> It depends ;) Bernhards git tree is more uptodate regarding toolchain,
>> but the svn tree has more/newer packages and more developers.
> 
> Exactly. I basically ignore packages completely, apart from the, let's
> say 5-10 that i actually use or find useful.

I've been looking for recent gcc for the cris arch as I was seeing gcc internal errors when compiling kernel or openssl source with gcc 4.2.3 or 4.2.4.
With gcc 4.3.1 gcc internal errors went away, so I'm really glad I found the GIT tree!

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si
