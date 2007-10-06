From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Sat, 6 Oct 2007 22:07:55 +0200
Subject: [Buildroot] ARM soft-float toolchain build crashes 20071004
In-Reply-To: <155346.38582.qm@web32610.mail.mud.yahoo.com>
References: <155346.38582.qm@web32610.mail.mud.yahoo.com>
Message-ID: <20071006200755.GG20951@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 04, 2007 at 03:11:44PM -0700, Gertjan Hofman wrote:
>Don't want to report this as a bug if it's not...but.
>
>Dowload 4-Oct-2007 version of buildroot. Choose ARM

Unfortunately this doesn't tell me what svn revision that is, but this
doesn't really matter this time.

>processor, choose 'soft-float' in make menuconfig.

Please note that this is not a crash but a build-failure.

I have a sample for an ARM integrator in target/Arm.
Can you check your settings against this one and follow-up with your
findings?

TIA,
