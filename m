From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Jan 2021 09:27:16 +0100
Subject: [Buildroot] [PATCH] package/logrotate: bump to 3.18.0 version
In-Reply-To: <20210128152634.20492-1-vadym.kochan@plvision.eu> (Vadym Kochan's
 message of "Thu, 28 Jan 2021 17:26:34 +0200")
References: <20210128152634.20492-1-vadym.kochan@plvision.eu>
Message-ID: <871re4ywpn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadym" == Vadym Kochan <vadym.kochan@plvision.eu> writes:

 > Main reason is to fix the issue when secure_getenv() is missing
 > in older toolchain, but it was fixed in this version by using
 > getenv() as alternative.

 > Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
