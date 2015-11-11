From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 23:26:39 +0100
Subject: [Buildroot] [PATCH v2] package/python-protobuf: eliminate
 unneeded build-time dependencies
In-Reply-To: <1447118686-10548-1-git-send-email-steven@uplinklabs.net>
References: <1447118686-10548-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151111232639.5cddfc6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Mon,  9 Nov 2015 17:24:46 -0800, Steven Noonan wrote:
> This was causing unexpected HTTP requests by the setup.py script for
> python-protobuf. These "dependencies" aren't actually required for a successful
> build, and are not staged into the target install directory.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/e44/e44694f30e39266491a1040e284e504d6d37ef9e/
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  v2: renamed .patch file, added 'Fixes' annotation, added Tested-by.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
