From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jun 2016 16:43:47 +0200
Subject: [Buildroot] [PATCH] fwup: disable documentation build
In-Reply-To: <CA+-urNSj1yLeKcvY5Zpk5h+AfYP5J78k8k3crH_+ybk1=MQzWA@mail.gmail.com>
 (Frank Hunleth's message of "Tue, 21 Jun 2016 08:37:17 -0400")
References: <dcd45c085506be96cfcec71a7357ddeba84c2df3.1466511361.git.baruch@tkos.co.il>
 <CA+-urNSj1yLeKcvY5Zpk5h+AfYP5J78k8k3crH_+ybk1=MQzWA@mail.gmail.com>
Message-ID: <87twgmy53w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Hi Baruch,
 > On Tue, Jun 21, 2016 at 8:16 AM, Baruch Siach <baruch@tkos.co.il> wrote:
 >> Documentation build with help2man relies on the output of running 'fwup
 >> --help'. That obviously can't work with cross compilation.

 > Fwiw, there was a nearly identical patch a while ago that hasn't been
 > merged yet:

 > http://patchwork.ozlabs.org/patch/634937/

 > I prefer your commit comment, but I'm fine with whichever one gets
 > merged first. So,

 > Tested-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks. I've committed this and marked the earlier patch as superseeded.

-- 
Bye, Peter Korsgaard
