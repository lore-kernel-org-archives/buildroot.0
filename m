From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 23:08:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.8.3
In-Reply-To: <20200614202346.133133-1-aduskett@gmail.com> (aduskett's message
 of "Sun, 14 Jun 2020 13:23:46 -0700")
References: <20200614202346.133133-1-aduskett@gmail.com>
Message-ID: <875zaoxz8t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This fixes a number of security issues:

https://docs.python.org/release/3.8.3/whatsnew/changelog.html#security

So I've adjusted the commit message to make this clear and ommitted to
2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
