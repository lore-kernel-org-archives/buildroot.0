From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 23:12:42 +0100
Subject: [Buildroot] [PATCH 1/1] dvdrw-tools: new package
In-Reply-To: <1426618658-22572-1-git-send-email-skenton@ou.edu>
References: <1426618658-22572-1-git-send-email-skenton@ou.edu>
Message-ID: <20150317231242.610a3030@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steve Kenton,

On Tue, 17 Mar 2015 13:57:38 -0500, Steve Kenton wrote:
> The dvd+rw-tools are used to master Blu-ray Disc
> and DVD Disc media, both +RW/+R and -RW/-R. Note:
> The +RW in the name is a historical artifact. This
> package contains the widely used growisofs program.
> 
> Signed-off-by: Steve Kenton <skenton@ou.edu>

One thing you forgot to do is to adjust the way the patch is generated
to include a version number. You should have done:

	git format-patch --subject-prefix="PATCH v5"

for example. And then include a changelog between the different
versions.

But that will be for another patch, since I applied this version. I
only did some minor final changes to it:

    [Thomas:
     - adjust minor formatting issues in Config.in file.
     - remove unneeded empty line in hash file.
     - make the mkisofs symbolic link a relative one.]

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
