From: Andrei Emeltchenko <andrei.emeltchenko.news@gmail.com>
Date: Thu, 25 Jan 2018 18:38:29 +0200
Subject: [Buildroot] [PATCH 1/1] package: Add thunderbolt-tools package
In-Reply-To: <CAGm1_kvTptVPf4TVcyKNvfFsqH8V2wG8GQ36QJJZEpHsBgZ8tA@mail.gmail.com>
References: <20180125130903.9481-1-Andrei.Emeltchenko.news@gmail.com>
 <CAGm1_kvTptVPf4TVcyKNvfFsqH8V2wG8GQ36QJJZEpHsBgZ8tA@mail.gmail.com>
Message-ID: <20180125163827.zw24oxm4bgvrrcrb@comms.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yegor,

Thanks for review,

On Thu, Jan 25, 2018 at 03:19:39PM +0100, Yegor Yefremov wrote:
> > +
> > +THUNDERBOLT_TOOLS_DEPENDENCIES = host-pkgconf boost eudev
> 
> Add licence info, i.e.
> https://github.com/intel/thunderbolt-software-user-space/blob/master/COPYING
> and SPDX type of the licence. See the manual.

It is "BSD-style" ;).

If I cannot get SPDX type, can I copy license file to
package directory and specify it like:

THUNDERBOLT_TOOLS_LICENSE_FILES = COPYING


Best regards 
Andrei Emeltchenko 
