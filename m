From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 06 May 2020 07:27:28 +0200
Subject: [Buildroot] [PATCH 3/4] package/polkit: add upstream fix for
 SIGTTOU
In-Reply-To: <20200418025816.1642936-3-aduskett@gmail.com> (aduskett's message
 of "Fri, 17 Apr 2020 19:58:15 -0700")
References: <20200418025816.1642936-1-aduskett@gmail.com>
 <20200418025816.1642936-3-aduskett@gmail.com>
Message-ID: <87k11peipr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > If tty_handler() resets terminal while pkttyagent is run in background job,
 > the process gets stopped by SIGTTOU. This impacts systemctl, hence it must
 > be blocked for a while and then the process gets killed anyway.

 > Upstream commit: 28e3a6653d8c3777b07e0128a0d97d46e586e311

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
