From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Jan 2017 13:13:28 +0100
Subject: [Buildroot] [PATCH] jasper: bump to version 2.0.10
In-Reply-To: <20170114173527.gflazmfwaguwgdr5@tarshish> (Baruch Siach's
 message of "Sat, 14 Jan 2017 19:35:27 +0200")
References: <fb303a78ecb0aa757a78bc896b2c3627093528d3.1484254064.git.baruch@tkos.co.il>
 <87vatjat58.fsf@dell.be.48ers.dk>
 <20170114173527.gflazmfwaguwgdr5@tarshish>
Message-ID: <87eg03fbiv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Committed, thanks.
 >> 
 >> Did you verify that none of the reverse dependencies need the jpeg
 >> support?

 > I just build tested libraw, opencv, and opencv3. All built fine without 
 > BR2_PACKAGE_JPEG.

 > Kodi selects both BR2_PACKAGE_JASPER and BR2_PACKAGE_JPEG unconditionally, so 
 > it should not be affected by this change.

Ok, great - Thanks!

-- 
Bye, Peter Korsgaard
