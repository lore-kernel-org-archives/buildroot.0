From: Voss, Samuel M                            Collins <sam.voss@collins.com>
Date: Thu, 10 Jun 2021 20:14:45 +0000
Subject: [Buildroot] [External] Re: [PATCH] package/hostapd: add
 upstream patch to fix CVE-2021-27803
In-Reply-To: <87y2bnxyds.fsf@dell.be.48ers.dk>
References: <20210601180915.14897-1-sam.voss@collins.com>
 <20210601200043.GA168928@scaer>
 <11b326bb-8425-7615-f4bc-ce380dcadbf8@mind.be>
 <87y2bnxyds.fsf@dell.be.48ers.dk>
Message-ID: <DM2P110MB01073B48544B9028B3CD934485359@DM2P110MB0107.NAMP110.PROD.OUTLOOK.COM>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

>-----Original Message-----
>From: Peter Korsgaard <jacmet@gmail.com> On Behalf Of Peter Korsgaard
>Sent: Sunday, June 06, 2021 2:10 AM
>To: Arnout Vandecappelle <arnout@mind.be>
>Cc: Yann E. MORIN <yann.morin.1998@free.fr>; Voss, Samuel M Collins <sam.voss@collins.com>; Weber, Matthew L Collins <Matthew.Weber@collins.com>; Sergey Matyukevich <geomatsi@gmail.com>; buildroot at buildroot.org
>Subject: [External] Re: [PATCH] package/hostapd: add upstream patch to fix CVE-2021-27803
>
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>
>Hi,
>
> >> Could you look at providing a patch to wpa_supplicant for  >> CVE-2021-27803, please?
>
> >  Peter already applied it in 9ada4eb2f1c3d67ee49f6f5466738bcd821fc647, at the  > time there was no CVE yet. Fabrice later added the exception for CVE-2021-27803  > in 1a7cf592a834357c5777e452f0b7ab7652e7d389.
>
>Indeed. I did not add it to hostapd at the time, as the issue (to my reading at least) is specific to wpa_supplicant.
>
>Why are we adding it to hostapd here? Just for consistency?

Ultimately it was added because it was identified as a CVE against this version of the package, and a patch was available for it. It came up during CVE discovery on one of our products so I sent the patch accordingly.

I didn't personally take the onus to establish whether it was exploitable, just that it was reported as vulnerable.

Sam
