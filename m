From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Mon, 28 Nov 2011 15:14:01 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
Message-ID: <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like the possible methods for getting it are:

wget
svn
git
bzr

and none of those seem to apply to wanting to use a local copy.  So instead
I just did this:

cp etherlabmaster-1.0.tar.bz2 /home/user1/buildroot-2011.05/dl/

to get it in the dl/ directory.

Can anyone see a problem with this?
