From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 17:58:42 +0100
Subject: [Buildroot] [PATCH 02/10] lsof: convert to gentargets and bump
 to 4.84
In-Reply-To: <1286266963-23413-2-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
	<1286266963-23413-2-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20101212175842.4fa32b5c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  5 Oct 2010 01:22:35 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> An explanation is required for this package. The source for this
> package is an archive inside an archive. The gentargets makefile only
> extracts the first archive, but not the second. This causes the patch
> routine to fail. I hide the patches from the gentargets patch
> routine, and then extract and patch the second archive during the
> configure routine. Also, I've changed the patches to no longer point
> to the sub-directory, which is version dependent.
> 
> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>

Thanks, merged in one of my branch, with additional fixes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
