From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Mar 2021 23:52:22 +0100
Subject: [Buildroot] [PATCH 1/2] {linux, linux-headers}: bump 5.{4, 10,
 11}.x 4.{4, 9, 14, 19} series
In-Reply-To: <20210323180811.24938-1-petr.vorel@gmail.com> (Petr Vorel's
 message of "Tue, 23 Mar 2021 19:08:10 +0100")
References: <20210323180811.24938-1-petr.vorel@gmail.com>
Message-ID: <87lfa9il3t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Petr" == Petr Vorel <petr.vorel@gmail.com> writes:

 > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 > ---
 >  linux/Config.in                      |  4 ++--
 >  linux/linux.hash                     | 14 +++++++-------
 >  package/linux-headers/Config.in.host | 14 +++++++-------
 >  3 files changed, 16 insertions(+), 16 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 3370162faa..1f60fbc801 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -28,7 +28,7 @@ choice
 >  	prompt "Kernel version"
 
 >  config BR2_LINUX_KERNEL_LATEST_VERSION
 > -	bool "Latest version (5.11)"
 > +	bool "Latest version (5.11.8)"

While correct, we normally don't update the prompt for every minor
version number (which also makes backporting a bit more annoying), so
I've dropped that and committed, thanks.

-- 
Bye, Peter Korsgaard
