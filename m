From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Feb 2018 16:21:44 +0100
Subject: [Buildroot] [PATCH v2 2/5] python-sqlalchemy: new package
In-Reply-To: <20180206132506.30389-2-aduskett@gmail.com>
References: <20180206132506.30389-1-aduskett@gmail.com>
 <20180206132506.30389-2-aduskett@gmail.com>
Message-ID: <20180210162144.1784769f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution.

On Tue,  6 Feb 2018 08:25:03 -0500, Adam Duskett wrote:
> SQLAlchemy is the Python SQL toolkit and Object Relational Mapper that gives
> application developers the full power and flexibility of SQL.
> 
> It provides a full suite of well known enterprise-level persistence patterns,
> designed for efficient and high-performing database access, adapted into a
> simple and Pythonic domain language.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

It would be nice to run check-package before submitting packages:

$ ./utils/check-package package/python-sqlalchemy/*
package/python-sqlalchemy/Config.in:2: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-sqlalchemy/Config.in:3: should be indented with one tab (http://nightly.buildroot.org/#_config_files)
package/python-sqlalchemy/Config.in:4: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-sqlalchemy/Config.in:5: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-sqlalchemy/Config.in:6: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-sqlalchemy/Config.in:8: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-sqlalchemy/Config.in:9: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-sqlalchemy/Config.in:10: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
package/python-sqlalchemy/Config.in:11: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
31 lines processed
9 warnings generated

I've fixed those issues and applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
