From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:43:03 +0100
Subject: [Buildroot] [PATCH 1/1] rustc: disable for ARMV7A with EABI
In-Reply-To: <20180226200421.18131-1-eric.le.bihan.dev@free.fr> (Eric Le
 Bihan's message of "Mon, 26 Feb 2018 21:04:21 +0100")
References: <20180226200421.18131-1-eric.le.bihan.dev@free.fr>
Message-ID: <87d10rqsnc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Le Bihan <eric.le.bihan.dev@free.fr> writes:

 > The Rust project does not support armv7a EABI, only EABIHF [1]. So
 > disable rustc for this ARM variant.

 > Fixes:

 > - http://autobuild.buildroot.net/results/51c98ca5486e7e83725ababa437cbb8204ceb66b/

 > [1] https://forge.rust-lang.org/platform-support.html

 > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
