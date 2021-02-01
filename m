From: Bhattiprolu RaviKumar <ravikumar.bhattiprolu@gmail.com>
Date: Mon, 1 Feb 2021 18:50:30 +0530
Subject: [Buildroot] Question on udhcpc script
In-Reply-To: <87a6sonfgu.fsf@dell.be.48ers.dk>
References: <CAL2JCb_UdG5-PpWbz3Yd84mSM47pGJHsjyUOn7Tzm6r_=Q4Dkg@mail.gmail.com>
 <87a6sonfgu.fsf@dell.be.48ers.dk>
Message-ID: <CAL2JCb8RWKzBciDr6mGs3gUy1onKAnm3SQj04Ti3MzBG_wHG-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,
  The script in yocto seems to be derived from
package/busybox/udhcpc.script in buildroot. It also had the same
"wait_for_ipv6_default_route" function and same check.
regards,
Ravi

On Mon, Feb 1, 2021 at 5:54 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Bhattiprolu" == Bhattiprolu RaviKumar <
> ravikumar.bhattiprolu at gmail.com> writes:
>
>  >  All,
>  >   We are using busybox to get DHCPv6  address. However, I am bit
> confused
>  > on the part of the script /etc/udhcpc.d/50default:
>
> We don't have have such a script in Buildroot? It looks like yocto does
> though:
>
>
> https://git.yoctoproject.org/cgit.cgi/poky/commit/?id=763b11d0fd6b804c73f0f645a3025c8f82f5aaf1&context=6
>
> Please direct yocto questions to yocto.
>
> --
> Bye, Peter Korsgaard
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210201/afb928a1/attachment-0001.html>
