From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 Sep 2017 12:31:37 +0200
Subject: [Buildroot] [PATCH 1/3] package/minidlna: Do not mark .service
	file executable
In-Reply-To: <20170824214152.5742-1-andrew.smirnov@gmail.com> (Andrey
 Smirnov's message of "Thu, 24 Aug 2017 14:41:50 -0700")
References: <20170824214152.5742-1-andrew.smirnov@gmail.com>
Message-ID: <87ingwglti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andrey" == Andrey Smirnov <andrew.smirnov@gmail.com> writes:

 > Do not mark .service file executable, otherwise systemd
 > will give us a warning about it.

 > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Committed all 3 to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
