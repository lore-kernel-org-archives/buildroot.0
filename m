From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 17 Jan 2007 10:06:04 -0700
Subject: [Buildroot] updating "make" in buildroot package
In-Reply-To: <20070117152520.GA28672@aon.at>
References: <KLECJOHKIJNMEKLBDEGEKEJACDAA.sunil.ayyapureddy@semindia.in>
	<20070117152520.GA28672@aon.at>
Message-ID: <45AE577C.6040404@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer wrote:
> On Wed, Jan 17, 2007 at 07:34:46PM +0530, Sunil A wrote:
>> Hi,
>>   I have a buildroot package and while building the toolchain for my target
>> with that package,ther is an error message ?make too old?,so I would like to
>> know as how to update the makefile in a package.How do I integrate the new
>> makepackage into the buildroot package.
> 
> The "make" package in buildroot already is at the current 3.81 release version.
> What version do you suggest we update to?

I think the problem is with your *hosts* version of make.
