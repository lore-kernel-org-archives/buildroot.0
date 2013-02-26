From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Feb 2013 09:29:07 +0100
Subject: [Buildroot] [PATCH 02/11] manual: minor fix in patch-policy.txt
In-Reply-To: <677f6fbb5a9c1994131975c171a285c4335c38d8.1361827174.git.s.martin49@gmail.com>
References: <cover.1361827174.git.s.martin49@gmail.com>
 <677f6fbb5a9c1994131975c171a285c4335c38d8.1361827174.git.s.martin49@gmail.com>
Message-ID: <20130226092907.48b09b41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Mon, 25 Feb 2013 22:31:22 +0100, Samuel Martin wrote:

> +- If a patch does some package version fixes, this should be documented in the
> +commit message of the patch itself (or the message prepended to the 'diff'
> +itself).

I am not sure to understand this part.

> +* Otherwise, patch files matching +<packagename>-<description>.patch+
> +  are applied following the +ls+ command order.

Shouldn't we be enforcing a <packagename>-<number>-<description>.patch
policy, in order to ensure that patches are applied in the right order?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
