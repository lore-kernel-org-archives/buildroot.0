From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 May 2012 10:43:42 +0200
Subject: [Buildroot] [PATCH v3] ccache: allow dynamic selection of cache
	directory
In-Reply-To: <8a589c09d8949cf0f59b.1337197168@beantl019720> (Thomas De
 Schampheleire's message of "Wed, 16 May 2012 21:39:28 +0200")
References: <8a589c09d8949cf0f59b.1337197168@beantl019720>
Message-ID: <87k409op4x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> The existing ccache infrastructure sets the cache directory
 Thomas> hardcoded in the ccache binary. As this directory was set to
 Thomas> ~/.buildroot-ccache, the cache is not necessarily local
 Thomas> (e.g. in corporate environments the home directories may be
 Thomas> mounted over NFS.)  Previous versions of buildroot did allow to
 Thomas> set the cache directory, but this was also hardcoded (so you
 Thomas> had to rebuild ccache to change it), plus that support was
 Thomas> removed.  See
 Thomas> http://lists.busybox.net/pipermail/buildroot/2011-July/044511.html
 Thomas> for a discussion on this.

Committed, thanks.

-- 
Bye, Peter Korsgaard
