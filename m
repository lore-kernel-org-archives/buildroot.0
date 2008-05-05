From: hartleys <hartleys@visionengravers.com>
Date: Mon, 5 May 2008 17:02:29 -0400
Subject: [Buildroot] svn co/up package sample
In-Reply-To: <20080505201710.GD9589@mx.loc>
References: <1CF6EDDF0820924DA43C9A52FE7325950B282DA1@MI8NYCMAIL17.Mi8.com>
	<20080505201710.GD9589@mx.loc>
Message-ID: <1CF6EDDF0820924DA43C9A52FE7325950B2BEB58@MI8NYCMAIL17.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, May 05, 2008 1:17 PM, Bernhard Fischer wrote:
> >Hello all,
> >
> >Are there any packages that use svn co/up to download/update the 
> >package source?
>
> uclibc, busybox, gcc. Others trivially added.
> http://repo.or.cz/w/buildroot.git/

It appears those packages in your git are using $(WGET) to fetch the
package source. I'm looking for something that uses$(SVN_CO) and
$(SVN_UP). Did I just miss something?

Thanks,
Hartley
