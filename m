From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Aug 2018 23:27:56 +0200
Subject: [Buildroot] [PATCH 1/1] Postgresql: Bump to version 10.4
In-Reply-To: <20180806151714.18532-1-aduskett@gmail.com> (Adam Duskett's
 message of "Mon, 6 Aug 2018 11:17:14 -0400")
References: <20180806151714.18532-1-aduskett@gmail.com>
Message-ID: <87va8jdycj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:

 > Signed-off-by: Adam Duskett <aduskett@gmail.com>

I see Thomas has applied it to next. Looking at the release notes, I see
that it fixes a minor security issue (CVE-2018-1115):

https://www.postgresql.org/docs/10/static/release-10-4.html

Does this apply to the Buildroot package? Should this be applied to
master and 2018.02.x / 2018.05.x as well?

I also see that 10.5 has gotten released, fixing two security issues:

https://www.postgresql.org/docs/10/static/release-10-5.html

Care to send a patch bumping the version to 10.5?

-- 
Bye, Peter Korsgaard
