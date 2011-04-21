From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 21 Apr 2011 18:29:31 -0400
Subject: [Buildroot] [PATCH] ncurses: version bump to 5.8
In-Reply-To: <877hanz56u.fsf@macbook.be.48ers.dk>
References: <1300923770-13698-1-git-send-email-vapier@gentoo.org>
	<871v1iz4rw.fsf@macbook.be.48ers.dk> <1301952165.27248.2.camel@segulix>
	<87pqogj49u.fsf@macbook.be.48ers.dk> <1303322103.8512.4.camel@segulix>
	<878vv423zn.fsf@macbook.be.48ers.dk> <1303413743.6641.12.camel@segulix>
	<877hanz56u.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTikW4aebOtn_TBzRHQd+7+iYjEWtQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Apr 21, 2011 at 5:04 PM, Peter Korsgaard wrote:
>> Sergio Monteiro Basto writes:
>>> I haven't tried, but doesn't that just shuffle part of the ncurses
>>> functions into libtinfo? I don't right away see why that would fix
>>> anything, but I'll start a build now.
>>
>> so, it fix anything ?
>
> No, as expected the behaviour is exactly the same.

ncurses 5.9 is out and seems to be mostly a bugfix release over 5.8
... probably worth testing
-mike
