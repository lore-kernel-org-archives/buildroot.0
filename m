From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 00:16:27 +0100
Subject: [Buildroot] [PATCH] neard: fix missing nfc.h header
In-Reply-To: <510EEEEA.2040208@mind.be>
References: <1359898643-24467-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <510EEEEA.2040208@mind.be>
Message-ID: <20130204001627.1a898fb2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Mon, 04 Feb 2013 00:12:42 +0100, Arnout Vandecappelle wrote:

>   Wouldn't it be simpler to move the header to
> include/stub/linux/nfc.h and add include/stub to the include path?

Certainly yes it could be done as a follow-up improvement :)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
