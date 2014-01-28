From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:13:39 +0100
Subject: [Buildroot] [PATCH 3/5] package/tzdata: install a default
 localtime
In-Reply-To: <8738kwc316.fsf@dell.be.48ers.dk>
References: <cover.1389134731.git.yann.morin.1998@free.fr>
 <d33faa4dcebfdac0f304495fcdac3db1f31c791d.1389134731.git.yann.morin.1998@free.fr>
 <8738kwc316.fsf@dell.be.48ers.dk>
Message-ID: <20140128221339.34b2ce7d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 09 Jan 2014 21:29:25 +0100, Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > Add an option to install a default localtime.
> 
>  > since tzdata only makes sense for (e)glibc, we don't care
>  > that we install timezone files that uClibc can't understand.
> 
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Committed, thanks.

I thought I said somewhere I was not happy with this patch, because it
creates a different solution to set the timezone for eglibc and uClibc.
We should instead strive to have an option under "System configuration"
to define the timezone, and ensure it does the right thing for both
uClibc and eglibc.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
