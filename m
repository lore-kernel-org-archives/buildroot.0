From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 May 2018 23:34:29 +0200
Subject: [Buildroot] [PATCH 1/1] lttng-tools: Install to staging
In-Reply-To: <20180522152847.21479-1-jfaith@impinj.com> (John Faith's message
 of "Tue, 22 May 2018 08:28:47 -0700")
References: <20180522152847.21479-1-jfaith@impinj.com>
Message-ID: <87h8mzz862.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Faith <jfaith@impinj.com> writes:

 > Install the LTTng control library headers and shared objects
 > to staging.

 > The C interface to LTTng described here:
 > https://lttng.org/docs/v2.10/#doc-liblttng-ctl-lttng
 > requires including <lttng/lttng.h> and linking against liblttng-ctl,
 > but those parts are not available unless this package does a staging
 > install.

 > Signed-off-by: John Faith <jfaith@impinj.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
