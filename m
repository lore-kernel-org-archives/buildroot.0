From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Feb 2018 16:22:09 +0100
Subject: [Buildroot] [PATCH 1/1] ntp: implicitly enable openssl-random
In-Reply-To: <20171108131839.27491-1-aduskett@gmail.com> (Adam Duskett's
 message of "Wed, 8 Nov 2017 08:18:39 -0500")
References: <20171108131839.27491-1-aduskett@gmail.com>
Message-ID: <87lgg8ye3i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > If OpenSSL is selected, --enable-openssl-random should be implicitly
 > set as well.

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

Committed after fixing/extending the commit message to explain that this
is just for consistency with the disable case, thanks.

-- 
Bye, Peter Korsgaard
