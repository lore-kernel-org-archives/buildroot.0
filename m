From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jan 2021 22:45:15 +0100
Subject: [Buildroot] [PATCH] package/dbus: bump to version 1.12.20
In-Reply-To: <20210109121719.52155-1-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sat, 9 Jan 2021 13:17:19 +0100")
References: <20210109121719.52155-1-francois.perrad@gadz.org>
Message-ID: <87turnm9lg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Looking at the NEWS file, I see that this in fact fixes (a fairly
unlikely) security issue, so it should have been marked as such:

https://gitlab.freedesktop.org/dbus/dbus/blob/dbus-1.12/NEWS

Committed to 2020.02.x and 2020.11.x after adjusting the commit message
to make this clear, thanks.

-- 
Bye, Peter Korsgaard
