From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 5 Apr 2011 22:32:52 +0200
Subject: [Buildroot] Buildroot "install" wrapper to preserve file
	permissions
In-Reply-To: <87ipuswjux.fsf@macbook.be.48ers.dk>
References: <BANLkTi=gd8UtSZLpam0=Luyq8dZzcdfO_g@mail.gmail.com>
	<20110405215447.135159ef@surf> <87ipuswjux.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTimBTeADgaq2F_MhNY-2UTUQGXz0=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/4/5 Peter Korsgaard <jacmet@uclibc.org>:
> I think Daniel's proposal is to use a custom install program (wrapper),
> which would then automatically create those device_table.txt snippets.

Yes, that's how I meant. Sorry for any bad description.

I thing this would also make many packages installed by e.g. autoconf
preserve their permissions without any extra code.
