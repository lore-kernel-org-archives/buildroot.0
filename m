From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:09:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/liblockfile: add an upstream
 URL to Config.in
In-Reply-To: <20191128124552.2016-1-mark@dibsco.co.uk> (Mark Corbin's message
 of "Thu, 28 Nov 2019 12:45:52 +0000")
References: <20191128124552.2016-1-mark@dibsco.co.uk>
Message-ID: <878snzdp5t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark@dibsco.co.uk> writes:

 > Add an upstream URL to the help text in Config.in. This
 > addresses the 'Missing' URL status in the package stats
 > web page output.

 > Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
 > ---
 >  package/liblockfile/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/liblockfile/Config.in b/package/liblockfile/Config.in
 > index 88a9c338bb..83ffea86c8 100644
 > --- a/package/liblockfile/Config.in
 > +++ b/package/liblockfile/Config.in
 > @@ -2,3 +2,5 @@ config BR2_PACKAGE_LIBLOCKFILE
 >  	bool "liblockfile"
 >  	help
 >  	  NFS-safe locking library.
 > +
 > +	  https://github.com/miquels/liblockfile

Committed, thanks.

It would be good to bump the version from our current Debian snapshot to
here as well.

-- 
Bye, Peter Korsgaard
