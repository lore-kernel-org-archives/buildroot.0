From: Mike Zick <minimod@morethan.org>
Date: Thu, 2 Oct 2014 07:45:33 -0500
Subject: [Buildroot] [PATCH 1/1] libFTDI major version update 1. This
 version can coexists beside the 0.x version (libftdi.so, libftdi1.so).
In-Reply-To: <2.c5a9d6940ebdbeb712d0@polarstar>
References: <2.c5a9d6940ebdbeb712d0@polarstar>
Message-ID: <20141002074533.1ece2b48@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 02 Oct 2014 09:52:10 +0200
daniel.sangue at sangue.ch wrote:

> Give me some time because i havent a working smtp-server connection
> at work. And i can not do an incremental patch - because i have
> deleted the copy of the repo where the patch was based on. I only can
> create a new patch and take your proposed git message for it. Is this
> ok for you or what should i do now?
> 

As a long time M.L. reader, (not a reviewer) I feel safe in answering
this one.  ;)

The comments made where scattered throughout your submission, so I
don't think that your having to re-generate a new one will make
very much difference.

That is not what you would want to do to fix a single line "Oops"
of course, but in this case, it should be ok.

Just be sure to include the [PATCH V2 ... etc in the new title
and a comment about V1 -> V2 changes made.

Mike
> 
> Greets Dani
