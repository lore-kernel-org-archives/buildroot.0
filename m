From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 22 May 2017 14:00:22 +0200
Subject: [Buildroot] [PATCH/next] package/minidlna: bump version to 1.2.0
In-Reply-To: <20170521120417.18504-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sun, 21 May 2017 14:04:17 +0200")
References: <20170521120417.18504-1-bernd.kuhls@t-online.de>
Message-ID: <877f1914q1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Added locally computed sha256 hash.
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to next, thanks.

The changelog:

https://sourceforge.net/projects/minidlna/files/minidlna/1.2.0/

Talks about optional avahi support, so we probably need to handle that
in minidlna.mk. Care to take a look?

-- 
Bye, Peter Korsgaard
