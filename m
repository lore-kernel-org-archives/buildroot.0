From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Oct 2015 09:11:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/jsoncpp: broken with musl on x86
In-Reply-To: <1445932453.18019.1.camel@embedded.rocks>
References: <1445374313-30804-1-git-send-email-joerg.krause@embedded.rocks>
 <20151021135029.4b4b9e42@free-electrons.com>
 <20151027075207.51f35d1d@free-electrons.com>
 <1445932453.18019.1.camel@embedded.rocks>
Message-ID: <20151027091130.7fd9bc6a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue, 27 Oct 2015 08:54:13 +0100, J?rg Krause wrote:

> > line in CMakeLists.txt. And it builds just fine. It seems a lot
> > simpler
> > than propagating the reverse dependencies.
> > 
> > Could you submit a patch doing this ?
> 
> Indeed, this is much simpler. Many thanks for investigation ... I did
> not had the time. I'll prepare a patch for this soon!

I actually didn't do much investigation. I just googled the issue, and
in the discussion around the musl related patches sent to gcc, this was
discussed, and it was pointed out that the error only occurs if
-pedantic is used.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
