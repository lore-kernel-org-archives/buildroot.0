From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Oct 2014 12:32:36 +0200
Subject: [Buildroot] [PATCH v3] package/mono: new package
In-Reply-To: <CA+TH9V=qR-vBU+RHrzFj9KYqouzKnTgLZ4y+hUYOWkab6XS8hg@mail.gmail.com>
References: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141010204840.4ec4d5d3@free-electrons.com>
 <CA+TH9VkBYm1viE8=o9Miy8Pb4mGrmUxCdDJZ1rTncSysfbcPiA@mail.gmail.com>
 <CA+TH9V=qR-vBU+RHrzFj9KYqouzKnTgLZ4y+hUYOWkab6XS8hg@mail.gmail.com>
Message-ID: <20141011123236.3c9d4cc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Fri, 10 Oct 2014 21:36:33 +0200, Angelo Compagnucci wrote:

> Another thing. I'm using this patch as a training to understand better
> how to write good buildroot packages. I hope to contribute more in the
> future! I really appreciate any hint and I prefer to write the patch
> myself!
> So I will be really grateful if you can review this patch and point me
> to the right direction, step by step, if it's not to much a hassle for
> you!

Here are improved patches:

 * One patch adding the host-monolite package, so that Mono doesn't
   download Monolite on its own.

 * One patch adding the mono and host-mono packages.

It's still using the old Mono version, so you'll have to update that
and check that it continues to work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-monolite-new-package.patch
Type: text/x-patch
Size: 1181 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141011/42105c16/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0002-mono-new-package.patch
Type: text/x-patch
Size: 6364 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141011/42105c16/attachment-0001.bin>
