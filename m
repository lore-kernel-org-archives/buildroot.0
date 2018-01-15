From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 12:07:05 +0100
Subject: [Buildroot] [PATCH] wolfssl: fix build on ARMV8
In-Reply-To: <CANu7NGse6X1ozAKbseGCC33i5gpc5wuqEt+CevzNq+UHc4hxDA@mail.gmail.com>
References: <1516010110-11590-1-git-send-email-sergio.prado@e-labworks.com>
 <20180115113238.66aef010@windsurf>
 <CANu7NGse6X1ozAKbseGCC33i5gpc5wuqEt+CevzNq+UHc4hxDA@mail.gmail.com>
Message-ID: <20180115120705.6b0d7d51@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 15 Jan 2018 08:59:22 -0200, Sergio Prado wrote:

> > So perhaps --disable-armasm should be passed unconditionally?
> >  
> 
> It's disabled by default. Should we still pass it?

Well, it's always good practice to be explicit about config options I
believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
