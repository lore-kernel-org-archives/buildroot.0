From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Oct 2019 11:07:31 +0200
Subject: [Buildroot] [PATCH 5/9] package/libnetconf2: add package
In-Reply-To: <CAEyMn7aftGM_4VOgq=THLgmBVFn__qMgiMuqxnu8A=PkUsiTug@mail.gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
 <20191001143023.698-5-heiko.thiery@gmail.com>
 <20191002092859.4312bab1@windsurf.home>
 <CAEyMn7aftGM_4VOgq=THLgmBVFn__qMgiMuqxnu8A=PkUsiTug@mail.gmail.com>
Message-ID: <20191004110731.40c1c08f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Oct 2019 10:51:41 +0200
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> > So SSH support is optional ? Why did you made it mandatory ?  
> 
> For the target application that is used we need the LIBSSH_SERVER. But
> you're right, this can be an optional.
> 
> I will enable it in the package that requiers it and let it disabled
> for the host. With this the "host-libssh" support is not needed any
> more.

OK, but if it's optional, we also want it to be optional for the target
variant of the package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
