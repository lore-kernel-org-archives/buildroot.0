From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 10:15:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for
 2020-09-10
In-Reply-To: <38c1b78d-82f6-2d50-a60f-eb6a161d22f8@heine.tech>
References: <20200911070826.658B8868D9@whitealder.osuosl.org>
 <38c1b78d-82f6-2d50-a60f-eb6a161d22f8@heine.tech>
Message-ID: <20200911101547.77832bc9@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 11 Sep 2020 09:29:20 +0200
Michael Nosthoff <buildroot@heine.tech> wrote:

> On 11.09.2020 09:08, Thomas Petazzoni wrote:
> >   aarch64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/c2078e821e0728fe980be2c849c25d82e791a4c2 |     
> >   mips64el   |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/b554f6f2fb66892273f7520ad6e36923557b229e |     
> >    x86_64    |        host-grpc-1.31.0        | NOK | http://autobuild.buildroot.net/results/3ebb2880b9b3fd5154979016391dde897e2c039c |       
> 
> All those cases seem to fail with a GNU 4.8.2 host toolchain. I would
> like to reproduce that. On what OS are those build jobs run? Is this
> maybe a Docker Image which I could use?

Yes, Yann had a Docker image that allows to reproduce the issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
