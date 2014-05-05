From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 5 May 2014 09:57:55 +0200
Subject: [Buildroot] 2014.05 release cycle: open patches to consider
In-Reply-To: <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
References: <CAAXf6LWk1C0uUjY3-5=a0347TnQyBRym9SpQUZN=xj0aNfNRNg@mail.gmail.com>
 <CAAXf6LXWw5ybnPVNgjaadipuhG9PTv8LLsCzpnSC9h6QMNq9iA@mail.gmail.com>
Message-ID: <CAAXf6LXTSdbCzQZHWxtiEOX9qc3NkGyTAttdte66wUX+eCAiKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 2, 2014 at 10:33 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
>
> http://patchwork.ozlabs.org/patch/332885/
> Makefile: move fs/common.mk above external.mk
> Philippe Reynes <tremyfr@yahoo.fr>

I just sent a rebased version of this patch.
I tested the concern of Peter with respect to locale
purging/generation, and all seems fine.

[..]

> http://patchwork.ozlabs.org/patch/341675/
> [1/1] cups: move localstatedir from /usr/var to /var
> Danomi Manchego

Has been applied by Peter, thanks!

Best regards,
Thomas
