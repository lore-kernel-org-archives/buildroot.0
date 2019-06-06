From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Jun 2019 14:17:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/autossh: bump version to 1.4g
In-Reply-To: <1559764619-8118-1-git-send-email-tolvupostur@gmail.com> (Einar
 Jon Gunnarsson's message of "Wed, 5 Jun 2019 21:56:58 +0200")
References: <1559764619-8118-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <87lfyenc1i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Einar" == Einar Jon Gunnarsson <tolvupostur@gmail.com> writes:

 > Version 1.4g most notably addresses a bug that could see an alarm signal
 > occur without a handler, causing autossh to exit inappropriately.

Committed, thanks.

Does this mean that we also want this on the 2019.02.x (LTS) and
2019.05.x (stable) branches?

-- 
Bye, Peter Korsgaard
