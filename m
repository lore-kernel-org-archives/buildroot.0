From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jan 2015 22:15:49 +0100
Subject: [Buildroot] [PATCH 1/2] rsyslog: remove pointless umask from
 sysv initscript
In-Reply-To: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421266617-9201-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150114221549.5f12df01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 14 Jan 2015 17:16:56 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/rsyslog/S01logging | 1 -
>  1 file changed, 1 deletion(-)

Thanks, both patches applied. I've added 3 more patches on top to do
some further minor cleanup/improvements in rsyslog.mk.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
