From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Feb 2016 13:20:27 +0100
Subject: [Buildroot] [PATCH] glibc: remove version 2.21
In-Reply-To: <1456142845-5372-2-git-send-email-gustavo@zacarias.com.ar>
References: <1456142845-5372-1-git-send-email-gustavo@zacarias.com.ar>
 <1456142845-5372-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160222132027.091e7c84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Mon, 22 Feb 2016 09:07:25 -0300, Gustavo Zacarias wrote:
> Mask out glibc for sparc as well since it's no longer available.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Is it SPARC entirely, or only some specific architecture variants of
SPARC that are no longer supported ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
