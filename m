From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Thu, 5 Mar 2015 14:11:57 -0600
Subject: [Buildroot] [PATCH] wine: Add dependency check for ALSA
In-Reply-To: <54F8B0C0.2040806@dawncrow.de>
References: <54F8B0C0.2040806@dawncrow.de>
Message-ID: <CAMQcK5KuEbdPvpCXssPfstXrtn6ogPHoQesPe1_O7ceDxFBOTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andr? ,

On Thu, Mar 5, 2015 at 1:38 PM, Andr? Hentschel <nerv@dawncrow.de> wrote:

You should move the fixes line above your signed off line as follows
otherwise it will not be preserved in the commit message:

Fixes:
  http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/

> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>
> This fixes the problem from http://autobuild.buildroot.org/results/018/018391c5e70d33bc0b5745ad7a2a273efa9be0d7/
>
>  package/wine/wine.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
