From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 18:50:01 +0100
Subject: [Buildroot] [PATCH v2] trinity: enable only for supported
 architectures
In-Reply-To: <1414516222-3480-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1414516222-3480-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141028185001.167858fe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Tue, 28 Oct 2014 17:10:22 +0000, Vicente Olivert Riera wrote:
> This package only has support for some architectures which are listed in
> the project website: http://codemonkey.org.uk/projects/trinity/
> 
> We enable this package only for those supported architectures which are
> also supported in Buildroot.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/ea7/ea788f1f0ed5ee4e9b1bf0c8a0d1304e7467dc77/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes since v1:
> - Removed MIPS64 after talking with upstream and doing a runtime test.

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
