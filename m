From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Nov 2017 13:32:11 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: no longer require openssl
In-Reply-To: <20171107212906.31336-1-Adamduskett@outlook.com> (Adam Duskett's
 message of "Tue, 7 Nov 2017 16:29:06 -0500")
References: <20171107212906.31336-1-Adamduskett@outlook.com>
Message-ID: <87k1z1eyt0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > 4.2.8p10 no longer requires openssl to compile.
 > Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

Committed, thanks.

Is there no --enable-openssl-random? If yes, why don't we use it for the
openssl case?

-- 
Bye, Peter Korsgaard
