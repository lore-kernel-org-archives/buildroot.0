From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 05 Nov 2018 23:14:50 +0100
Subject: [Buildroot] [PATCH 1/1] webkitgtk: disable JIT usage on MIPS32
 R6
In-Reply-To: <20181105153939.36369-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Mon, 5 Nov 2018 17:39:39 +0200")
References: <20181105153939.36369-1-aperez@igalia.com>
Message-ID: <87ftwfcgth.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Currently JavaScriptCore does not support JIT on MIPS32 R6, so remove
 > it from the list of supported architectures. Reported upstream:

 >   https://bugs.webkit.org/show_bug.cgi?id=191258

 > This fixes the following autobuilder failure:

 >   http://autobuild.buildroot.net/results/eeaf3edbf6f5bf468b10adc3d053f703c6ceba96/

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
