From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Nov 2011 09:45:11 +0100
Subject: [Buildroot] RFC: package patching
In-Reply-To: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Tue, 15 Nov 2011 09:33:38
 +0100")
References: <CAAXf6LXWc56UcU0s0DBRAVd4SKgB+3P6N49Dc4aGkYFP4oq20Q@mail.gmail.com>
Message-ID: <87k471n59k.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

Hi,

 Thomas> I think we should try and improve this.

 Thomas> A first approach could be to simply remove support for
 Thomas> foo-1.2.3-something.patch, and require version-specific patches to be
 Thomas> in a versioned subdirectory, package/foo/foo-1.2.3. For this, we
 Thomas> should remove line 02-04. In this case, common patches are applied
 Thomas> first, followed by versioned patches in subdirectories.

Yes, I know - We hit this with E.G. busybox in the past. I would go for
the versioned-patches-in-subdir, as we (luckily) only support multiple
versions for a limited number of packages.

-- 
Bye, Peter Korsgaard
