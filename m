From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Thu, 28 Jan 2010 17:54:21 +0100
Subject: [Buildroot] [PATCH 6/7] pixman: bump to 0.16.4
In-Reply-To: <87aavynr3x.fsf@macbook.be.48ers.dk>
References: <20100119201528.3733.74306.stgit@localhost.localdomain>
	<1263945936-8613-6-git-send-email-llandwerlin@gmail.com>
	<87aavynr3x.fsf@macbook.be.48ers.dk>
Message-ID: <4d28d4b51001280854k6085cb1ag8bb6b1836cd1241d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, inded I recently got a lot of error like that since
http://git.buildroot.org/buildroot/commit/?id=073af428efc21d7717c003e93a098d0767de3b0c

I updated the patch list since then :

http://git.potipota.net/cgi-bin/cgit.cgi/buildroot/log/?h=various-bumps

In this case (pixman) we need to deactivate libtool patching :

http://git.potipota.net/cgi-bin/cgit.cgi/buildroot/commit/?h=various-bumps&id=e04a2709b133ba0360392ead8519bc48eaea5895

Regards,

--
Lionel

On Thu, Jan 28, 2010 at 5:14 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:
>
>  llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
>  llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
>
> I get:
>
> >>>   Patching libtool
>
> Applying buildroot-libtool.patch using plaintext:
> patching file ltmain.sh
> Hunk #1 FAILED at 273.
> Hunk #2 succeeded at 5412 (offset 3005 lines).
> Hunk #3 FAILED at 2551.
> Hunk #4 FAILED at 2895.
> Hunk #5 succeeded at 8058 with fuzz 1 (offset 2446 lines).
> Hunk #6 FAILED at 5937.
> 4 out of 6 hunks FAILED -- saving rejects to file ltmain.sh.rej
> Patch failed!  Please fix buildroot-libtool.patch!
> make: *** [/tmp/br/build/pixman-0.16.4/.stamp_patched] Error 1
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100128/4e27e33b/attachment.htm>
