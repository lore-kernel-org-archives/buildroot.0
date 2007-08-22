From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 22 Aug 2007 14:40:29 +0200
Subject: [Buildroot] buildroot-20070720
In-Reply-To: <00e901c7e4b6$d77a8460$070514ac@atmel.com>
References: <1187730489.15882.7.camel@86-115-11-152>
	<20070821230818.GS11697@aon.at>
	<1187754477.4494.11.camel@86-115-11-152>
	<20070822080818.GA7523@aon.at>
	<00e901c7e4b6$d77a8460$070514ac@atmel.com>
Message-ID: <20070822124029.GA9846@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 22, 2007 at 02:19:50PM +0200, Ulf Samuelsson wrote:
 
>> Perhaps it would be a good idea if you (atmel) would use an SCM instead
>> of tarballs. Would make your life way easier, i imagine. Just a
>> thought..
>>
>
>They are using "git" and remove all svn info before they enter into their git system.
>They do not want to work with svn.
>
>Is there any chance that buildroot is moving over to "git"?.

given that there is a svn backend for git, this doesn't make much sense
to me. They should just pull upstream, git should be able to take care
for (most of) the rest, but i'll not mandate how atmel does their
busyness here ;)

'nuff said. You folks probably know this much better than i do, or
something like that

friendly,
Bernhard
