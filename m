From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2014 13:45:51 +0100
Subject: [Buildroot] [git commit] erlang: use libatomic_ops if available
In-Reply-To: <8761dbkbr6.fsf@dell.be.48ers.dk>
References: <20141215215003.A758F80403@busybox.osuosl.org>
 <20141216132618.5c19cb84@free-electrons.com>
 <8761dbkbr6.fsf@dell.be.48ers.dk>
Message-ID: <20141216134551.75ca7975@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 16 Dec 2014 13:41:33 +0100, Peter Korsgaard wrote:

>  > Is this really what we want to do? In such cases, we normally always
>  > force to use the "system" version of the library rather than the
>  > built-in one. Why should Erlang be treated differently, especially if
>  > using the "system" version of the library works fine?
> 
> So in other words, make erlang select libatomic_ops? That sounds fine to
> me.

Yes, that's what I meant: make erlang select libatomic_ops.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
