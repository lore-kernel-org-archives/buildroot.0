From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 22 Nov 2006 19:52:05 +0100
Subject: [Buildroot] problem generating c++ compiler for target arch
In-Reply-To: <32792.80.176.236.13.1164218791.squirrel@mail.primefarm.co.uk>
References: <32792.80.176.236.13.1164218791.squirrel@mail.primefarm.co.uk>
Message-ID: <20061122185205.GA5982@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2006 at 06:06:31PM -0000, lists at primefarm.co.uk wrote:
>Hi all,
>
>I'm using buildroot to generate cross compilers for the arm 920t running
>linux. Currently I have a working C compiler, but I really want c++
>working too.
>
>I get the following error when building (with latest svn release) with
>fairly minimal options (I have tried to configure it so that it only
>builds the compilers and related libs etc where possible).

I take it that 3.4.6 works, yes?
At least the index thing is fixed in 3.4.6 and later and i believe also
the rope.
