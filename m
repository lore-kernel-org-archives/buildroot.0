From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 22:28:11 +0100
Subject: [Buildroot] [PATCH v2] collectd: fix musl builds (ipc module)
In-Reply-To: <20151123111242.GA15180@vostro> (Alex Suykov's message of "Mon,
 23 Nov 2015 13:12:42 +0200")
References: <20151123111242.GA15180@vostro>
Message-ID: <874mg8v4b8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alex" == Alex Suykov <alex.suykov@gmail.com> writes:

 > src/ipc.c uses shm_info.used_ids which musl only provides when
 > _GNU_SOURCE is defined.

 > The issue has been fixed upstream, but the fix is not in their
 > latest 5.5.0 release. Adding their patch as a temporary fix
 > to be removed on the next version bump.

 > https://github.com/collectd/collectd/issues/1147
 > https://github.com/collectd/collectd/commit/3e3848349b753d78a0b1d19648fb394866856bda

 > Fixes
 > http://autobuild.buildroot.net/results/e981c08f01d2916246a17b1dc112e8b3e8c628e2/

 > Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
 > ---
 > v2: s-o-b line for the patch itself

Committed, thanks.

-- 
Bye, Peter Korsgaard
