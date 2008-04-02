From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Apr 2008 07:33:16 +0200
Subject: [Buildroot] [PATCH] add romfs support
In-Reply-To: <3530b0eb0804011424t3d88f2f2sc6777f9d7a9edf57@mail.gmail.com>
	(digitalpeer's message of "Tue\, 1 Apr 2008 14\:24\:00 -0700")
References: <3530b0eb0804011424t3d88f2f2sc6777f9d7a9edf57@mail.gmail.com>
Message-ID: <873aq4izxf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "digitalpeer" == digitalpeer  <buildroot@digitalpeer.com> writes:

 digitalpeer> The following patch adds the ability to generate a romfs
 digitalpeer> image using genromfs.

Just curious, why would anyone use romfs instead of the more modern
alternatives (cramfs, squashfs)?

-- 
Bye, Peter Korsgaard
