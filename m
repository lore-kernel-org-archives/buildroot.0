From: =?utf-8?B?U8O4cmVuc2VuLCBTdGVmYW4=?= <Stefan.Sorensen@spectralink.com>
Date: Thu, 19 Jul 2018 13:10:01 +0000
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <CANQCQpYd6XjQyVeKZ_O+L1TPL0dcE6TaAmbc51+d8+=0Z9PeFQ@mail.gmail.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <cc562d31-b770-c7e1-0a6d-e3f004c917db@mind.be>
 <CANQCQpaJd3-tj47Xp4XyFGvu9w5GcKZZyr+Pi98A0i1XRxa1Ww@mail.gmail.com>
 <2d96f4d291e7fc0eb2e17f497a840364ec6ec488.camel@spectralink.com>
 <CANQCQpYd6XjQyVeKZ_O+L1TPL0dcE6TaAmbc51+d8+=0Z9PeFQ@mail.gmail.com>
Message-ID: <2400f8a7f1f587d2ff8d351408c0558033150f7f.camel@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-07-19 at 07:58 -0500, Matthew Weber wrote:
> > It works fine with a single spec file - I used two different files
> > since I was keeping CFLAGS and LDFLAGS separate.
> > 
> 
> Something in the syntax then would have to change, right?  I combined
> the files and was getting CC errors.

That was what I did - I have not run into any problems. Any particular
packages that fails?

Stefan
