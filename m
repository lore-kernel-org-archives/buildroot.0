From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 15:43:47 +0100
Subject: [Buildroot] [PATCH 2/2] bash: bump to version 4.3
In-Reply-To: <1393534739-7133-2-git-send-email-gustavo@zacarias.com.ar>
References: <1393534739-7133-1-git-send-email-gustavo@zacarias.com.ar>
 <1393534739-7133-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301154347.7ce25d7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 27 Feb 2014 17:58:59 -0300, Gustavo Zacarias wrote:
> Switch to external readline support to potentially reduce target size.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---

This is causing some build issues, see
http://autobuild.buildroot.org/results/44a/44a962623be757143a3d6d37fc6cd14964094f79/build-end.log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
