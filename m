From: Steven J. Hill <sjhill@realitydiluted.com>
Date: Fri, 21 Mar 2008 23:56:03 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
In-Reply-To: <20080321180147.DA5513C342@busybox.net>
References: <20080321180147.DA5513C342@busybox.net>
Message-ID: <47E49163.5070805@realitydiluted.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ninevoltz at uclibc.org wrote:
> Author: ninevoltz
> Date: 2008-03-21 11:01:46 -0700 (Fri, 21 Mar 2008)
> New Revision: 21443
> 
> Log:
> Fixed xfsprogs to build without needing bzero & bcopy. Patch by Nigel Kukard
> 
Would you or Nigel please push this up to the xfsprogs maintainer(s)? These
legacy functions need to die and the only way they're going to is if we keep
pushing these back to the various package maintainers. Thanks.

- -Steve
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFH5JFjgyK5H2Ic36cRAq+QAJ9+9u4MjKi8VHJQ2e9YmDpPr9YIYwCeMgRw
Hn2+2Gmu+2o5jMQ1cCo83fo=
=C5Zy
-----END PGP SIGNATURE-----
