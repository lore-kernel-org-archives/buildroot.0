From: Bernhard Fischer <rep.nop@aon.at>
Date: Wed, 6 Dec 2006 09:34:07 +0100
Subject: [Buildroot] applying 'udev-fix-s3c2410-serial-perms.patch' fails
In-Reply-To: <0BD293AD-72AA-4B8F-9866-852B237EB81B@linux.it>
References: <0BD293AD-72AA-4B8F-9866-852B237EB81B@linux.it>
Message-ID: <20061206083407.GA12161@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Dec 05, 2006 at 10:22:19PM -0800, Rafael A Barrero wrote:
>Hi guys;
>
>I'm using buildroot from a few days ago and I'm coming across this  
>error while building 'udev-100':
>
>"Applying udev-fix-s3c2410-serial-perms.patch
>can't find file to patch at input line 4."
>
>Skipping the patch doesn't seem to work and it just errors out and  
>doesn't allow me to continue.

You can "skip" the patch by rm'ing it.
