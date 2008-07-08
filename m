From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 8 Jul 2008 10:21:21 -0300
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87r6a4ssaq.fsf@macbook.be.48ers.dk>
References: <20080707232011.1D0473C608@busybox.net>
	<878wwdvszs.fsf@macbook.be.48ers.dk>
	<20080708071418.GB23887@cloud.net.au>
	<87r6a4ssaq.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730807080621w4f148e4aqc6f8e29b1144ca5b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 8, 2008 at 5:18 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>  Hamish> Maybe we need to a -include a Makefile.local which would
>  Hamish> allow Ulf and others to customise the make without changing
>  Hamish> the master Makefile..
>
> Yes, that might be an idea.

Similarly one in package/Config.in would be nice. I have some custom
packages that are not meant to be commited, and sometimes I get
conflicts.
