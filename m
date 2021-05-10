From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 11:25:32 +0200
Subject: [Buildroot] [PATCH] package/cryptsetup: disable tmpfiles.d for
 host build
In-Reply-To: <20210507152159.542208-1-john@metanate.com> (John Keeping's
 message of "Fri, 7 May 2021 16:21:59 +0100")
References: <20210507152159.542208-1-john@metanate.com>
Message-ID: <87wns7rldf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > When building host-cryptsetup, if tmpfiles.d support is enabled then the
 > install step tries to install /usr/lib/tmpfiles.d/cryptsetup.conf
 > globally on the host system.

 > Even if the tmpfiles.d config were installed correctly in the host
 > directory, nothing would ever run these rules, so disable this feature
 > via configure.

 > Signed-off-by: John Keeping <john@metanate.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
