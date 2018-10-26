From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Oct 2018 12:18:33 +0200
Subject: [Buildroot] [PATCH] configs/{at91sam9*,
 atmel*}: drop OpenSSH as it duplicates Dropbear
In-Reply-To: <20181026100842.xrkc2wqhi6te72er@falbala.home.lespocky.de>
 (Alexander Dahl's message of "Fri, 26 Oct 2018 12:08:43 +0200")
References: <20181026094024.31108-1-thomas.petazzoni@bootlin.com>
 <9b5b2780-92cf-682a-7ada-f6af691652ad@microchip.com>
 <20181026100842.xrkc2wqhi6te72er@falbala.home.lespocky.de>
Message-ID: <878t2l57uu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

Hi,

 >> Is scp provided by Dropbear?

 > Yes it is. sftp is tricky, however.

server side sftp can be provided by gesftpserver.

-- 
Bye, Peter Korsgaard
