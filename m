From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 20:01:01 +0100
Subject: [Buildroot] [PATCH 2/2] package/wpewebkit: disable JIT for
 ARMv5 and ARMv6
In-Reply-To: <20201020154321.3491904-3-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 20 Oct 2020 18:43:21 +0300")
References: <20201020154321.3491904-1-aperez@igalia.com>
 <20201020154321.3491904-3-aperez@igalia.com>
Message-ID: <87sg9wg8lu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > WebKit's JavaScriptCore does not support using JIT nor the LLint
 > interpreter on ARMv5 and ARMv6, so add those two cases when checking
 > for target CPUs which need to use the CLoop interpreter.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
