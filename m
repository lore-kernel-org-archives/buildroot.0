From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Dec 2016 22:08:51 +0100
Subject: [Buildroot] [PATCH] eudev: build with older kernels.
In-Reply-To: <20161230153238.10458-1-barbieri@profusion.mobi> (Gustavo Sverzut
 Barbieri's message of "Fri, 30 Dec 2016 13:32:38 -0200")
References: <CAPdpN3AqMidYkSkAdjUygBzkXfVMELex3wjtsgyxqwiQdrr3zQ@mail.gmail.com>
 <20161230153238.10458-1-barbieri@profusion.mobi>
Message-ID: <87vau186qk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Sverzut Barbieri <barbieri@profusion.mobi> writes:

 > Add missing defines so eudev builds for older kernels such as 2.6
 > Signed-off-by: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
 > Reviewed-by: Romain Naour <romain.naour@gmail.com>

Committed after extending the commit message with details about when
these symbols were added and the link to the upstream patch submission,
thanks.

-- 
Bye, Peter Korsgaard
