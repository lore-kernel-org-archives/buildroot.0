From: Ryan Ordway <rordway@oregonstate.edu>
Date: Thu, 29 Nov 2007 23:00:36 -0800
Subject: [Buildroot] uClibc-nptl?
In-Reply-To: <20071129133008.GB20914@real.realitydiluted.com>
References: <1D3F8BA5-BB0F-4306-A179-760E18E1EF63@mac.com>
	<691A7752-1681-409D-936A-9C6A7935510F@oregonstate.edu>
	<20071129133008.GB20914@real.realitydiluted.com>
Message-ID: <FDBCCC91-31DB-4241-A25E-FC7DDECD2D08@oregonstate.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Nov 29, 2007, at 5:30 AM, Steven J. Hill wrote:

>> Has anyone gotten uClibc-nptl working with buildroot? Particularly on
>> the ARM arch.
>>
> The uClibc-NPTL patches for ARM have been posted to the list. They are
> not currently in trunk, but will get there in the next couple of  
> weeks.
> For now, you could get those patches, and create a tarball of the  
> uClibc
> code and call it 'uClibc-snapshot.tar.bz2'. Next, create the directory
> 'dl' in your buildroot tree and copy that tarball in there. Finally,
> select uClibc snapshot from the toolchain configuration menu and you
> should be set.


Great! Very good news!

Unfortunately I must have missed seeing the patches. All I can find  
are some old patches from CodeSourcery for 0.9.28 that look to be  
against r16550. I've browsed through the mailing list archives and the  
closest thing I can find is your message from 11/12. I'd appreciate a  
clue bat if you have the time.

Thanks,

Ryan

--
Ryan Ordway                           E-mail: rordway at oregonstate.edu
Unix Systems Administrator               rordway at library.oregonstate.edu
OSU Libraries, Corvallis, OR 97331    Office: Valley Library #4657
