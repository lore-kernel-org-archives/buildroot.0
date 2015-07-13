From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:37:47 +0200
Subject: [Buildroot] [PATCH v3 1/2] librtas: new package
In-Reply-To: <671713efe39467f10b56db5074d472dc45ceeec9.1432015191.git.sam.bobroff@au1.ibm.com>
References: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
 <671713efe39467f10b56db5074d472dc45ceeec9.1432015191.git.sam.bobroff@au1.ibm.com>
Message-ID: <20150713183747.738a5fc9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sam Bobroff,

On Tue, 19 May 2015 15:59:55 +1000, Sam Bobroff wrote:
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> v2:

Applied after the following changes:

    [Thomas:
      - make the package depend on glibc, since it needs execinfo.h
      - use TARGET_CONFIGURE_OPTS instead of defining manually CC and LD
      - add hash file
      - remove useless empty newline.
      Thanks to Romain Naour for the review!]

Thanks for the contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
