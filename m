From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 20 Sep 2007 11:45:22 +0200
Subject: [Buildroot] libid3tag build broken: Please add zlib
	to	dependency list
In-Reply-To: <1190269727.9021.23.camel@localhost.localdomain>
References: <145594.52785.qm@web62014.mail.re1.yahoo.com>
	<1190269727.9021.23.camel@localhost.localdomain>
Message-ID: <20070920094522.GE27699@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 20, 2007 at 08:28:47AM +0200, Hans-Christian Egtvedt wrote:
>
>On Wed, 2007-09-19 at 22:50 -0700, Doug the RockRat wrote:
>> The package/libid3tag/libid3tag.mk file needs zlib
>> added to the dependency.
>> 
>> Do you want a patch or is this good enough?
>
>Attached a patch, I also cleaned up some rules and typos, so the library
>is not rebuilt every time you build.

merged. Thanks!
