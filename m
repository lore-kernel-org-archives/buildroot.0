From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 18:44:18 +0200
Subject: [Buildroot] [PATCH v3 2/2] powerpc-utils: optionally use librtas
In-Reply-To: <9a73202315e0a236b78d9644905c20b79572f93d.1432015191.git.sam.bobroff@au1.ibm.com>
References: <cover.1432015191.git.sam.bobroff@au1.ibm.com>
 <9a73202315e0a236b78d9644905c20b79572f93d.1432015191.git.sam.bobroff@au1.ibm.com>
Message-ID: <20150713184418.66c0298b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sam Bobroff,

On Tue, 19 May 2015 15:59:56 +1000, Sam Bobroff wrote:
> Now that librtas is available, optionally use it with powerpc-utils to
> enable it's RTAS dependant functionality.  It is used by default, as
> most distros do, but made optional because it adds several new programs
> and significantly increases the size of the installed package.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>
> ---
> v3:

Applied after propagating the glibc dependency of librtas, as noted by
Romain Naour.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
