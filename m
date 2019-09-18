From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Sep 2019 21:16:42 +0200
Subject: [Buildroot] [pkg-luarocks 3/6] pkg-luarocks: regen packages
 with external dependencies
In-Reply-To: <CAB0FRstytkW+C-PcTKXQubHJZRwryrGwHB5tr7j-4jwTZt6wCA@mail.gmail.com>
References: <20190918061915.31250-1-francois.perrad@gadz.org>
 <20190918061915.31250-3-francois.perrad@gadz.org>
 <20190918093501.5b91d097@windsurf>
 <CAB0FRstytkW+C-PcTKXQubHJZRwryrGwHB5tr7j-4jwTZt6wCA@mail.gmail.com>
Message-ID: <20190918211642.1517aa3f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Sep 2019 20:19:14 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> Yes, it looks redundant.
> _BUILD_OPT contains a list of key/value,
> the value is always the same ($(STAGING_DIR)/usr),
> but the key (SQLITE_DIR in this case) depends of the rock.
> 
> This is the LuaRocks way.

I understand, but before your change such xyz_DIR were not needed, and
now they are needed. This looks like a "regression" in the sense that
things are worse than they were.

Could you explain why the existing solution no longer works ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
