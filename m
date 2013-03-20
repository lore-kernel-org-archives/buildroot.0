From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Mar 2013 09:31:44 +0100
Subject: [Buildroot] [PATCH] toolchain: update crosstool-NG project URL
In-Reply-To: <87mwtzt7ys.fsf@dell.be.48ers.dk>
References: <1363720538-12992-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87mwtzt7ys.fsf@dell.be.48ers.dk>
Message-ID: <20130320093144.2c239146@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 19 Mar 2013 22:06:51 +0100, Peter Korsgaard wrote:

> Thanks, but what tree did you make this against? It doesn't apply to
> current head (we have a select BR2_TOOLCHAIN_HAS_THREADS_DEBUG_IF_NEEDED
> line).

I did it on top of the gdb infrastructure patch, I didn't realize it
was so close to a gdb change that it would conflict.

I'll resend a new version on top of Git master.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
