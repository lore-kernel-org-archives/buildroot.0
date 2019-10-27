From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:24:35 +0100
Subject: [Buildroot] [PATCH v3 2/4] support/docker: add python3
In-Reply-To: <20191027133630.7706-2-nicolas.carrier@orolia.com>
References: <20191027133630.7706-1-nicolas.carrier@orolia.com>
 <20191027133630.7706-2-nicolas.carrier@orolia.com>
Message-ID: <20191027202435.69339d23@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 13:36:53 +0000
Nicolas Carrier <nicolas.carrier@orolia.com> wrote:

> From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> The test infra will soon be converted to Python 3 only.
> So add the interpreter and also the Python 3 variant of modules nose2
> and pexpect to the docker image used to run runtime tests.
> 
> Keep the Python 2 variant of those modules to allow a gradual
> transition.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> 
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
