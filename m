From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Dec 2017 13:43:16 +0100
Subject: [Buildroot] [PATCH v2 1/1] nginx: Harden patches for using
 pkg-config
In-Reply-To: <20171219101024.ihi276tfg6s5gti6@zenon.in.qult.net>
References: <20171218225903.ocsiikdxr4est2wr@zenon.in.qult.net>
 <20171219101024.ihi276tfg6s5gti6@zenon.in.qult.net>
Message-ID: <20171219134316.6956197a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Dec 2017 11:10:24 +0100, Ignacy Gaw?dzki wrote:
> Don't simply remove "-I" from the output of pkg-config --cflags-only-I
> but match the -I argument more generally.

OK, but why? What is this fixing?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
