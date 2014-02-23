From: =?ISO-8859-1?Q?Ezequiel_Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
Date: Sun, 23 Feb 2014 20:46:37 -0300
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140223110021.16b6b976@skate>
References: <20140223073009.3676E101056@stock.ovh.net>
 <20140223110021.16b6b976@skate>
Message-ID: <CAAEAJfBPQdJC3Q7pr5tmkGsWdVW9W7cJBmPOE1OWMOKo-Kj88Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23 February 2014 07:00, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
>>      nios2 |                 minidlna-1.1.1 | NOK | http://autobuild.buildroot.net/results/2e6fa6e4891b5cc4c75943130158aa24fa77f26e/
>
> configure: error: Could not find libavformat - part of ffmpeg
> make: *** [/home/test/test/3/output/build/minidlna-1.1.1/.stamp_configured] Error 1
>
> Ezequiel?
>

Already discussed here: http://patchwork.ozlabs.org/patch/312275/

Since it seems a compiler bug, all we can do for now is disable minidlna
for nios2 with a note about a compiler's bug.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
