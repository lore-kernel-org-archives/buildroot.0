From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 28 Jun 2010 01:03:07 +0000 (UTC)
Subject: [Buildroot] [git commit master 1/1] initramfs: update help text
References: <20100626054529.9E7CE81E0B@busybox.osuosl.org>
	<i052d8$8up$1@dough.gmane.org> <87aaqh38vi.fsf@macbook.be.48ers.dk>
	<i06hjh$fj$2@dough.gmane.org> <87hbkp3sfz.fsf@macbook.be.48ers.dk>
	<i07kg9$jsp$1@dough.gmane.org> <87631444ss.fsf@macbook.be.48ers.dk>
Message-ID: <i08scb$3fn$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-06-27, Peter Korsgaard <jacmet@uclibc.org> wrote:

> Is there any advantage to using a source file for gen_init_cpio instead
> of just building a cpio archive?

No, I don't think so.  But if you're not allowed to build the list of
files/nodes to go into a cpio archive, surely building the cpio
archive is out of the question?

-- 
Grant
