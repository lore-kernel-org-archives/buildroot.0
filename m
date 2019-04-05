From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Apr 2019 22:48:45 +0200
Subject: [Buildroot] [PATCH] package/tpm2-tools: drop unused dbus /
 libglib2 dependencies
In-Reply-To: <20190404190028.16680-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 4 Apr 2019 21:00:28 +0200")
References: <20190404190028.16680-1-peter@korsgaard.com>
Message-ID: <87h8bcnpoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > tpm2-tools does not need dbus or libglib2, so remove them and the
 > corresponding toolchain dependencies.

 > The confusion may have come from the upstream travis configuration, which
 > also builds tpm2-abrmd (which uses dbus+libglib2).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
