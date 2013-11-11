From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Mon, 11 Nov 2013 09:25:03 -0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131109191543.414f5694@skate>
References: <20131109073028.B3C2E52C614@lolut.humanoidz.org>
 <20131109191543.414f5694@skate>
Message-ID: <CAAEAJfAnZs_5kXpjD_qUn0xHU-H7A1O-0p6yR+tnuVLvKMsEPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On 9 November 2013 15:15, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:

>
>>      nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/8c01fdaac7afa00bd1117c79ae047344242d1463/
>>      nios2 |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/a418145d72e92f64956518bb2786e33dadd08a86/
>
> NIOS2 support missing in libnspr. Ezequiel, can you look into this?
> Normally, adding an architecture support in libnspr is really easy, so
> adding a patch to libnspr should be feasible.
>

Right. Would you accept a "builds-only" patch for it?
I'm not familiar with libnspr and it seems it's only loosely used
through libnss in BR.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
