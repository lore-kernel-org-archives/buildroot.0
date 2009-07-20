From: Daniel Mack <daniel@caiaq.de>
Date: Mon, 20 Jul 2009 13:25:25 +0200
Subject: [Buildroot] [PATCH 2/2] mtd-utils.git: fix targets
In-Reply-To: <878wikg3sp.fsf@macbook.be.48ers.dk>
References: <1244029145-11832-1-git-send-email-daniel@caiaq.de>
	<1244029145-11832-2-git-send-email-daniel@caiaq.de>
	<878wikg3sp.fsf@macbook.be.48ers.dk>
Message-ID: <20090720112525.GV13236@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 19, 2009 at 04:12:22PM +0200, Peter Korsgaard wrote:
> >>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:
> 
>  Daniel> Update git version for mtd-utils.git.
>  Daniel> In this new version, a new tool named 'ubiformat' exists which is
>  Daniel> exported by this patch.
> 
> What about the patches? They no longer apply:
> 
> Applying mtd-utils-all-targets.patch using plaintext: 
> patching file Makefile
> Hunk #1 FAILED at 72.
> 1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
> Patch failed!  Please fix mtd-utils-all-targets.patch!

Erm, yes. Sorry. I removed them locally but forgot to add that to the
patch. They're not needed anymore. Could you do that when commiting?

Thanks,
Daniel
