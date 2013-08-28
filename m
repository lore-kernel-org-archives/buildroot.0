From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 28 Aug 2013 08:55:19 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20130828134945.17351cba@skate>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate> <521DD858.4060105@zacarias.com.ar>
 <20130828133005.3e63a718@skate> <521DE03E.2060708@zacarias.com.ar>
 <20130828134945.17351cba@skate>
Message-ID: <521DE527.7070008@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/28/2013 08:49 AM, Thomas Petazzoni wrote:
>> IIRC that's what gcc says but i think i've tested it and it was in >=4.4
> 
> The particular toolchain that caused the build failure is
> BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103, which is based on
> gcc 4.5.2.
> 
> And according to the gcc documentation, it was added in 4.6, see
> http://gcc.gnu.org/gcc-4.6/changes.html. It's also confirmed by
> http://forums.gentoo.org/viewtopic-t-947998-start-0.html, which says
> that the undefined reference to _Static_assert disappeared when moving
> from 4.5 to 4.6.

Mixed up with sync_and_fetch stuff then which 4.4+ handles IIRC.
Regards.
