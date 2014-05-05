From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 5 May 2014 15:21:26 +0200
Subject: [Buildroot] 2014.05 release cycle: open patches to consider
In-Reply-To: <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
References: <CAAXf6LWk1C0uUjY3-5=a0347TnQyBRym9SpQUZN=xj0aNfNRNg@mail.gmail.com>
 <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
Message-ID: <CAAXf6LUArpFkyEAqDPz8d8Vy4gjQ=OFbVAZuPFH5mqxvqkpQpw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Here the current overview of patches in this list that have not yet
been applied, with updated links:

> http://patchwork.ozlabs.org/patch/323339/
> [v2,1/2] infra: Add generic check_prog_host function
> http://patchwork.ozlabs.org/patch/323340/
> [v2,2/2] classpath: Use generic check for host program
> Maxime Hadjinlian

new versions: http://patchwork.ozlabs.org/patch/345366/ and
http://patchwork.ozlabs.org/patch/345367/

>
> http://patchwork.ozlabs.org/patch/332885/
> Makefile: move fs/common.mk above external.mk
> Philippe Reynes <tremyfr@yahoo.fr>

new version: http://patchwork.ozlabs.org/patch/345605/

>
> http://patchwork.ozlabs.org/patch/334855/
> [v3] infra: Add PRE_*_HOOKS for every step
> Maxime Hadjinlian
>

new version: http://patchwork.ozlabs.org/patch/345719/


> http://patchwork.ozlabs.org/patch/337161/
> perf: Fix compilation without libelf for post-3.10 kernels
> Peter Meerwald pmeerw at pmeerw.net

Same version, now reviewed/tested by me.

> http://patchwork.ozlabs.org/patch/344390/
> [v3,1/2] ccache: change default cache directory path to match config setting
> http://patchwork.ozlabs.org/patch/344391/
> [v3,2/2] ccache: provide capability to do initial ccache setup
> Danomi Manchego
>

Same versions, now reviewed/tested by me.


Best regards,
Thomas
