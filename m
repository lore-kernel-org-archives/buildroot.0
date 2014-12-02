From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 02 Dec 2014 10:07:09 -0300
Subject: [Buildroot] Crypto algorithms in buildroot
In-Reply-To: <moN.NaWF.1NQamTY5FuN.1KVRaa@seznam.cz>
References: <lb1.NaXB.3cxqHjbWLxJ.1KVPDw@seznam.cz>	<547DA34A.6080909@zacarias.com.ar>
 <moN.NaWF.1NQamTY5FuN.1KVRaa@seznam.cz>
Message-ID: <547DB97D.4080101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/02/2014 10:05 AM, Ja Bi wrote:

> Hm, but when installed, there are some, aren't they? (ssl as i wrote,
> ssh, kernel, and maybe more) 
> 
> I dont need it from ehm...any technicals reasons, but for bureaucracy :( 
> 
> Thank you very much for reply.
> Jan

Buildroot is a tool that builds root filesystems (firmware, pendrive,
whatever) which is highly configurable, so it pretty much depends on
your configuration files which (if any) crypto software is installed.
Regards.
