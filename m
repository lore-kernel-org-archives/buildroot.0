From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Dec 2009 22:18:28 +0100
Subject: [Buildroot] uclibc/buildroot build error
In-Reply-To: <d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
	(joyful@sonic.net's message of "Mon, 21 Dec 2009 13:05:46 -0800")
References: <8351cdc2a3a8abf9b1f031824d6770e4.squirrel@webmail.sonic.net>
	<87fx772veo.fsf@macbook.be.48ers.dk>
	<d8fdfca5396745cde67af9bc66e27177.squirrel@webmail.sonic.net>
Message-ID: <87oclsxbyz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "joyful" == joyful  <joyful@sonic.net> writes:

Hi,

 joyful> Hi Peter, thanks for answering my question. However, the
 joyful> problem is in buildroot building uclic part.  Somehow the make
 joyful> file either in buildroot or uclibc missing an operand.  I
 joyful> copied the .config file in the directory manually did not help.

 joyful> cp -dpf  /tmp/buildroot/project_build_i686/uclibc/linux-2.6.29.2/.config
 joyful> cp: missing destination file operand after

That line is afaik from the kernel build, not from uclibc building.

Please check if you see the same problem with buildroot 2009.11, and if
you do, send the .config file to the list and I'll take a look.

-- 
Bye, Peter Korsgaard
