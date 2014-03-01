From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 20:41:07 +0100
Subject: [Buildroot] [PATCH] bash: always prefix readline
In-Reply-To: <1393696466-11902-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393696466-11902-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301204107.43d5dcc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  1 Mar 2014 14:54:26 -0300, Gustavo Zacarias wrote:
> Always prefix the readline directory otherwise autodetection may pick up
> the host readline when headers are available and target == host (or are
> link-compatible). Fixes:
> http://autobuild.buildroot.org/results/44a/44a962623be757143a3d6d37fc6cd14964094f79/

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
