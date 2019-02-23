From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Feb 2019 16:32:54 +0100
Subject: [Buildroot] [PATCH] lua-curl: add variant definition of
 lcurl_url_t
In-Reply-To: <20190223144641.14346-1-francois.perrad@gadz.org>
References: <20190223144641.14346-1-francois.perrad@gadz.org>
Message-ID: <20190223163254.4e18c71c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Feb 2019 15:46:41 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> fix build http://autobuild.buildroot.org/results/8d7/8d76ad49837b368a7bba3c3dfd445a035471268a/

For you future patches, could you use the following format instead:

"""
Fixes:

  http://autobuild.buildroot.org/results/8d76ad49837b368a7bba3c3dfd445a035471268a/

"""

i.e:

 - Use the "Fixes:" keyword, which gets noticed by patchwork, and
   allows us to clearly identify the patch as a build fix

 - Use the slightly shorter autobuilder URL: there's no need to repeat
   the /8d7/ directory.

Also, the commit title prefix should always be "package/foo:"

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
