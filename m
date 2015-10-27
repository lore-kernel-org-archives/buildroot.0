From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 22:57:41 +0100
Subject: [Buildroot] [PATCH] uclibc: get rid of ARC's uClibc fork
In-Reply-To: <562FCCF2.8090208@mind.be>
References: <1445959005-23917-1-git-send-email-abrodkin@synopsys.com>
 <562FCCF2.8090208@mind.be>
Message-ID: <20151027225741.333ad3f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 27 Oct 2015 20:13:54 +0100, Arnout Vandecappelle wrote:
> On 27-10-15 16:16, Alexey Brodkin wrote:
> > For quite some time all ARC changes have been pushed upstream.
> > So both uClibc master branch 
> 
>  In that case, perhaps the snapshot version should be enabled for ARC?

To be honest, I am wondering if this snapshot thing is really useful in
any way. Is anyone really using this ? Why do we have this for uClibc
and not for any other package ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
