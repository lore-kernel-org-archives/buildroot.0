From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 18:50:41 +0100
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--http-url" option for submition URL
In-Reply-To: <1477142835-17843-1-git-send-email-vzakhar@synopsys.com>
References: <1477142835-17843-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170206185041.67b0e587@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Oct 2016 16:27:15 +0300, Vlad Zakharov wrote:
> This commit introduces "--http-url" option.
> Described option is used to pass URL of the resourse to submit the
> results of the script.
> 
> Default value refers to standard buildroot sumbition URL:
> http://autobuild.buildroot.org/submit/
> 
> Such update allows users to submit ther results not only to
> standard buildroot autobuild resource but also somewhere
> else.
> 
> Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> ---
>  scripts/autobuild-run | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
