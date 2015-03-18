From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Mar 2015 14:40:19 +0100
Subject: [Buildroot] [PATCH] readline: bump to patchlevel 8
In-Reply-To: <1426684045-23609-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426684045-23609-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150318144019.5a4a8f46@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 18 Mar 2015 10:07:25 -0300, Gustavo Zacarias wrote:
> Fixes various issues, one in particular reported by Pascal de Bruijn on
> IRC where bash won't timeout when using readline as in 'read -e -t 10',
> which should escape back to shell when left alone for 10 seconds.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
