From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Jan 2014 21:29:25 +0100
Subject: [Buildroot] [PATCH 3/5] package/tzdata: install a default
	localtime
In-Reply-To: <d33faa4dcebfdac0f304495fcdac3db1f31c791d.1389134731.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 7 Jan 2014 23:46:06 +0100")
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <d33faa4dcebfdac0f304495fcdac3db1f31c791d.1389134731.git.yann.morin.1998@free.fr>
Message-ID: <8738kwc316.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Add an option to install a default localtime.

 > since tzdata only makes sense for (e)glibc, we don't care
 > that we install timezone files that uClibc can't understand.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
