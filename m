From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 19 Jul 2018 07:58:07 -0500
Subject: [Buildroot] [PATCH 3/6] package/Makefile.in: Use gcc spec files
 for PIE build flags
In-Reply-To: <2d96f4d291e7fc0eb2e17f497a840364ec6ec488.camel@spectralink.com>
References: <20180711143113.11927-1-matthew.weber@rockwellcollins.com>
 <20180711143113.11927-4-matthew.weber@rockwellcollins.com>
 <cc562d31-b770-c7e1-0a6d-e3f004c917db@mind.be>
 <CANQCQpaJd3-tj47Xp4XyFGvu9w5GcKZZyr+Pi98A0i1XRxa1Ww@mail.gmail.com>
 <2d96f4d291e7fc0eb2e17f497a840364ec6ec488.camel@spectralink.com>
Message-ID: <CANQCQpYd6XjQyVeKZ_O+L1TPL0dcE6TaAmbc51+d8+=0Z9PeFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Thu, Jul 19, 2018 at 4:49 AM, S?rensen, Stefan
<Stefan.Sorensen@spectralink.com> wrote:
>
> On Wed, 2018-07-11 at 18:17 -0500, Matthew Weber wrote:
> > Related to using a single spec file.  I'm not to familiar with using
> > them but since we have a mix of good/bad flag options already
> > occurring, guessing it wouldn't matter to consolidate to one file.  I
> > can test going to a single file. Stefan, do you know?
>
> It works fine with a single spec file - I used two different files
> since I was keeping CFLAGS and LDFLAGS separate.
>

Something in the syntax then would have to change, right?  I combined
the files and was getting CC errors.
