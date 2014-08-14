From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Aug 2014 20:30:10 +0200
Subject: [Buildroot] [PATCH 1/1] bandwidthd: incorporate fixes for
 autobuilders
In-Reply-To: <1408039777-23988-1-git-send-email-nroach44@gmail.com>
References: <1408039777-23988-1-git-send-email-nroach44@gmail.com>
Message-ID: <20140814203010.2664881b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Fri, 15 Aug 2014 02:09:37 +0800, Nathaniel Roach wrote:
> Version bump to -r08
> 	"[patched] the configure.ac script to remove the hardcoded
> 	-L/usr/local/lib and -I/usr/local/include. The bandwidthd package
> 	-was already autoreconfigured, so there is no need to add it."
> 
> "Adding the --without-x option, which ensures that the configure.ac
> 	script will not add -L/usr/lib to the compiler flags (and we anyway
> 	haven't added any sort of X.org support to bandwidthd for the
> 	moment)."
> 
> Both fixes by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>

This patch lacks the reference to the autobuilder failure.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
