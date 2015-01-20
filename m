From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Jan 2015 13:09:18 +0200
Subject: [Buildroot] [PATCH] iperf: add license information
In-Reply-To: <CACQ1gAimqif=SX4yJqFOqyrto-aPEzF5EyY7S9JHgY5-QDU8MA@mail.gmail.com>
References: <1421748906-417-1-git-send-email-richard.genoud@gmail.com>
 <20150120105132.GD2146@tarshish>
 <CACQ1gAimqif=SX4yJqFOqyrto-aPEzF5EyY7S9JHgY5-QDU8MA@mail.gmail.com>
Message-ID: <20150120110918.GE2146@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

On Tue, Jan 20, 2015 at 12:03:06PM +0100, Richard Genoud wrote:
> 2015-01-20 11:51 GMT+01:00 Baruch Siach <baruch@tkos.co.il>:
> > On Tue, Jan 20, 2015 at 11:15:06AM +0100, Richard Genoud wrote:
> >> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> >> ---
> >>  package/iperf/iperf.mk | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
> >> index 2947e5241974..4ec56e0f2c23 100644
> >> --- a/package/iperf/iperf.mk
> >> +++ b/package/iperf/iperf.mk
> >> @@ -6,6 +6,7 @@
> >>
> >>  IPERF_VERSION = 2.0.5
> >>  IPERF_SITE = http://downloads.sourceforge.net/project/iperf
> >> +IPERF_LICENSE_FILES = COPYING
> >
> > Missing IPERF_LICENSE.
> 
> damned !
> you're right, I forgot that.
> 
> hum... and now that I read the COPYING file, I understand why I didn't
> fill the IPERF_LICENSE : it's not a "known" license :
> Copyright (c) 1999-2007, The Board of Trustees of the University of Illinois
> All Rights Reserved.
> 
> Iperf performance test
> Mark Gates
> Ajay Tirumala
> Jim Ferguson
> Jon Dugan
> Feng Qin
> Kevin Gibbs
> John Estabrook
> National Laboratory for Applied Network Research
> National Center for Supercomputing Applications
> University of Illinois at Urbana-Champaign
> http://www.ncsa.uiuc.edu
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software (Iperf) and associated documentation files (the "Software"),
> to deal in the Software without restriction, including without limitation the
> rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
> sell copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> 
> Redistributions of source code must retain the above copyright notice, this
> list of conditions and the following disclaimers.
> 
> Redistributions in binary form must reproduce the above copyright notice, this
> list of conditions and the following disclaimers in the documentation and/or
> other materials provided with the distribution.
> 
> Neither the names of the University of Illinois, NCSA, nor the names of its
> contributors may be used to endorse or promote products derived from this
> Software without specific prior written permission.  THE SOFTWARE IS PROVIDED
> "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
> LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
> AND NONINFRINGEMENT. IN NO EVENT SHALL THE CONTIBUTORS OR COPYRIGHT HOLDERS BE
> LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
> CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> 
> 
> So, should I call it "Iperf 2.x license" ?

Looks very similar to the MIT license (http://opensource.org/licenses/MIT). 
IANAL, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
