From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Jan 2013 18:01:44 +0100
Subject: [Buildroot] Using a precompiled busybox toolchain as an
 external toolchain
In-Reply-To: <CAKvQZ_32NuJQwOr7e4Vy6TOFfWguwe+oHaCmstR9JVRSfGqymA@mail.gmail.com>
References: <CAKvQZ_0sLwXqmGeTdeC6EBqqZ_FN4s6cVcnM3OwVrSHHYHfWDA@mail.gmail.com>
 <20121218135336.2e24d6bc@skate>
 <CAKvQZ_3-v9ArCy0b6Q9VmzNToDaigk1=USPJsgUKpEptzeP1yA@mail.gmail.com>
 <20121218163210.1573a9c7@skate>
 <CAKvQZ_2ZJ9GOV-B2Gi1zG-gjJiFVYHxpd4GzFCHCAg7ABAPFUA@mail.gmail.com>
 <CAKvQZ_1hK1dXwVs5W5XpuZY=O6AZj-Y8XtCHirW+wyXQ4Fwx8g@mail.gmail.com>
 <CAHXCMMKctqMgQxnTzX1nG8Sm8W9NuxwLgaf8sGC_dH6aQr8uDg@mail.gmail.com>
 <CAKvQZ_2B1bQeLf3zdbUsLwLApx+zU=3D4HTAfu41W3iYwg=zOA@mail.gmail.com>
 <CAKvQZ_0Lc78AXKj-QaxEnchZpfrWsdZ=J_kgookHevnrmZEEhQ@mail.gmail.com>
 <20130129170842.7508fa3f@skate>
 <CAKvQZ_32NuJQwOr7e4Vy6TOFfWguwe+oHaCmstR9JVRSfGqymA@mail.gmail.com>
Message-ID: <20130129180144.6dd8a5ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Willy Lambert,

On Tue, 29 Jan 2013 17:49:14 +0100, Willy Lambert wrote:

> Yes, it's kind of you to have written all those historical details.
> May I update the documentation with some of those clarifications ?

Actually, most of this is already in the documentation (but not the
HTML version visible on Buildroot website, since the HTML version
visible is the one generated from the latest stable release, and those
changes have been done after the last stable release). But if you feel
something is missing, then yes, don't hesitate to submit a
documentation patch!

> So in the end, if I want to use the generated toolchain  (in
> $(O)/host) to build my own application (which is not a package, it's
> the user end application) it is never relocable if I use buildroot
> internal or crosstool-ng. I don't mind with that, it's just a matter
> of knowing what's happening.

As of today, yes, you're correct. It's however considered a bug to be
fixed, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
