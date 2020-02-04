From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 10:51:54 +0100
Subject: [Buildroot] [PATCH] package/xen: bump to version 4.13.0
In-Reply-To: <20200203224241.12481-1-alistair.francis@wdc.com> (Alistair
 Francis's message of "Mon, 3 Feb 2020 14:42:41 -0800")
References: <20200203224241.12481-1-alistair.francis@wdc.com>
Message-ID: <87zhdyn0hx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alistair" == Alistair Francis <alistair.francis@wdc.com> writes:

 > Bump to the latest version of Xen and remove the no longer required
 > patch.

 > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Committed, thanks.

I see from the release notes
(https://wiki.xenproject.org/wiki/Xen_Project_4.13_Release_Notes) that
it should now work with python 3.x. Given that python 2.x is now EOL, it
would be good if we could change it to use host-python3 instead.

Is this something you can look into?

-- 
Bye, Peter Korsgaard
