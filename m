From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 8 Aug 2012 13:58:31 +0000 (UTC)
Subject: [Buildroot] building native gcc for target
References: <CAKWKLJCPCYuYteR7s6xrUgBH6j5aOfn28431eeSQeGqVT5Z3=g@mail.gmail.com>
 <CAJJ6jxszVqjSSLCsU0oVbWAb72KBo1jf5U6kFEBHpED+RniKdw@mail.gmail.com>
 <5021CE95.9000808@sri.com>
Message-ID: <jvtra6$e8e$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-08-08, Scott Moore <scott.moore@sri.com> wrote:
> On 8/7/12 7:19 PM, Steve Calfee wrote:
>
>> I guess you haven't seen how to do it because it is kind of bizarre.
>> You want to cross compile a native mode compiler. Why?
>
> According to http://www.uclibc.org/toolchains.html (which
> unfortunately seems quite out of date), this is a recommended way of
> creating a development system for using uClibc.
>
> I'm actually trying to do something similar to easily build
> applications in a "clean" environment with only uClibc headers, etc,

I don't see why a cross compiler built using Crosstool-NG doesn't
satisfy that requirement.

-- 
Grant Edwards               grant.b.edwards        Yow! Spreading peanut
                                  at               butter reminds me of
                              gmail.com            opera!!  I wonder why?
