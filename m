From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 22:23:30 +0100
Subject: [Buildroot] [PATCH 1/2] fs: Bail out on errors in fakeroot
 script
In-Reply-To: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
References: <1424792855-14278-1-git-send-email-stefan.sorensen@spectralink.com>
Message-ID: <20150308222330.140a0479@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan S?rensen,

On Tue, 24 Feb 2015 16:47:34 +0100, Stefan S?rensen wrote:
> Currently, the generated fakeroot script has no error checking causing
> make to continue building even if some of the fakeroot script commands
> have failed. This can cause e.g. using an invalid device tables to go
> unnoticed.
> 
> So add a "set -e" to the start of the fakeroot script so it will exit
> with a failure code as soon as one of the script commands fails.
> 
> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
