From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2019 21:31:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: select libseccomp
 when sandbox is enabled
In-Reply-To: <20191215185401.3843763-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Sun, 15 Dec 2019 20:54:01 +0200")
References: <20191215185401.3843763-1-aperez@igalia.com>
Message-ID: <877e2xe3g7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > Select BR2_PACKAGE_LIBSECCOMP when the sandboxing support is enabled
 > during configuration.

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
