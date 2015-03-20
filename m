From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 17:02:29 +0100
Subject: [Buildroot] Worried about patches not being merged?
In-Reply-To: <CA+TH9V=wUa6Sh+uszjndiy-FaHsxzbVuvjAFcQWVxTg=qEeJTw@mail.gmail.com>
References: <20150304232101.437af48f@free-electrons.com>
 <1426708866.1395.8.camel@embedded.rocks>
 <CA+TH9VmRWPdidNHSLArTek4Pxxtw+viOy7_tMbMYturnq0-VaQ@mail.gmail.com>
 <20150319101643.6a4eeed3@free-electrons.com>
 <CA+TH9Vm9myq5YS_3+CsvT5-SZXcGyug3KDUO0Ai8f+daMf6BYg@mail.gmail.com>
 <20150319112638.6e5fc986@free-electrons.com>
 <CA+TH9VnnocY3CWhuiDOL6mZMSCZj+5GXTJpE5yna5pnGqKj8Lg@mail.gmail.com>
 <20150319120923.65bda6ab@free-electrons.com>
 <CA+TH9V=wUa6Sh+uszjndiy-FaHsxzbVuvjAFcQWVxTg=qEeJTw@mail.gmail.com>
Message-ID: <20150320170229.16a1de9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Thu, 19 Mar 2015 23:27:22 +0100, Angelo Compagnucci wrote:

> I have more or less done, I think in the WE I can push a patch to have
> tags attached to patches.

Awesome. Another thing that would be great in the long term is to make
the patchwork UI a bit reactive (Ajax stuff, etc.).

> > Ah, really? Could you describe a bit the workflow / how it would work ?
> 
> I have to find more time to elaborate if that software could be bended
> to buildroot needs. I have only a superficially view right now. I
> promise to look better at it.

Ok, thanks.

> > Well, is there really such a huge pile of new packages / medium level
> > patches / newbie patches ? We tend to apply them fairly quickly, in
> > general.
> 
> Yes, but I have the impression that patches tends to accumulate in a
> stack fashion, so the patches served are the last arrived. If a patch
> slips out of scope, it takes some time to get reviewed/committed. This
> is wouldn't be a critic to your great work nor the work of the other
> great reviewer/committers!

Yes, I agree this is what happens, but there is more or less a reason
for it. When a new patch arrives, if it's a fairly trivial package
bump, hash addition, or new package addition not raising any particular
question, then it's just good to apply it quickly so that it gets out
of the way.

Then, what happens is that what remains from this quick effort are the
more complicated patches, that tend to pile up.

Whenever I spend an evening applying patches, I generally try to work
in two passes: first a quick pass on all the trivial stuff of the day
(or past few days), and then a second pass during which I try to handle
a few older patches.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
