From: Michael S. Zick <minimod@morethan.org>
Date: Sun, 4 Mar 2012 10:50:55 -0600
Subject: [Buildroot] Buildroot 2012.02-rc3 released
In-Reply-To: <CAJJ6jxtaJwjGSrn5GUH29bu+=gu3UyM2p+a3W2Onk6Gg=N9_OA@mail.gmail.com>
References: <87ehtg2r6n.fsf@macbook.be.48ers.dk> <4F4EF091.8030906@gmail.com>
 <CAJJ6jxtaJwjGSrn5GUH29bu+=gu3UyM2p+a3W2Onk6Gg=N9_OA@mail.gmail.com>
Message-ID: <201203041050.57184.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun March 4 2012, Steve Calfee wrote:
> Hi all,
> 
> Something is seriously messed up with DNS. After the osuosl guys
> "fixed" it, I can no longer access  wget
> 'http://git.buildroot.net/buildroot/plain/CHANGES?id=2012.02_rc3' at
> work, which was working, briefly before that.
> 
> So now I cannot access git.buildroot.net from 3 separate isps. All
> three local networks are NATed, two have a wireless router as the
> gateway. I don't think this is a rare configuration. I have not had
> this problem accessing any http server or of several git servers.
> 
> It would really be nice to git fetch the latest release!
>

Still works here, but....

Do these systems have IPv6 connectivity?

The IPv4 DNS is a CNAME chain of domains that ends with an IPv4 address.
The IPv6 DNS is a CNAME chain of domains that ends in /net/dev/null. ;-)

Any chance that your installation of git is trying to use IPv6?

- - - -

Second question -
You write that all three local networks are NATed.
Did the same person write the NAT rules?  ;-)
That might be a common failure point.

Mike
> Regards, Steve
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
