From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 21:54:12 +0100
Subject: [Buildroot] [PATCHv2] qtuio: add error handling to for loop
In-Reply-To: <1417644344-3116-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1417644344-3116-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141207215412.08d08b84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On Wed,  3 Dec 2014 23:05:44 +0100, Thomas Petazzoni wrote:
> Also remove unneeded sub-shell usage in the build and installation
> steps. It is kept for the configure step as it is actually useful, and
> works fine because "|| exit 1" is outside the sub-shell.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
