From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 1 May 2017 23:02:56 -0500
Subject: [Buildroot] uboot-tools autobuild failures
In-Reply-To: <CAOMZO5BqQ1FC8j=sW=4tbozA1ytKZaEi6-dTCMPNSPcbaxDCag@mail.gmail.com>
References: <CANQCQpb0U3tO7Z-Lsz1pxmekaKYC8JyU7BJgtcXwLDWDgh1xNw@mail.gmail.com>
 <CAOMZO5D8cXv4+TF=kXMwE5_YE_mCKMhgjS+PCAbSkKHkewzSjA@mail.gmail.com>
 <CANQCQpb5_1uO+TR6X6Mk6XFW0HBV1f5b6zVvd0BF=yOOOjTT3Q@mail.gmail.com>
 <CAOMZO5BqQ1FC8j=sW=4tbozA1ytKZaEi6-dTCMPNSPcbaxDCag@mail.gmail.com>
Message-ID: <CANQCQpa_2orpqoRB_wXe2E3MmjkQ8ujbnj_Rtty+_YFtcHProg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Apr 25, 2017 at 12:09 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Tue, Apr 25, 2017 at 2:07 PM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>
>> No luck, same error.  I did notice this seems to be impacted by -j level.
>
> Please report this error in the U-boot list. Thanks

Done and I submitted a workaround for now until a clean fix can be
found upstream.
https://patchwork.ozlabs.org/patch/757382/
