From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 23 Jan 2019 14:19:14 -0600
Subject: [Buildroot] [PATCH] package/iperf: bump to 2.0.13
In-Reply-To: <20190123102825.gtswtv7v3lvtg3vh@falbala.home.lespocky.de>
References: <1548182070-35867-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20190123102825.gtswtv7v3lvtg3vh@falbala.home.lespocky.de>
Message-ID: <CANQCQpYqUZSdd5KbT4rFG9yAMeDqXbNrjjstoMGWrzbJYwQP5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alexander,


On Wed, Jan 23, 2019 at 4:28 AM Alexander Dahl <post@lespocky.de> wrote:
>
> Hei hei,
>
> On Tue, Jan 22, 2019 at 12:34:30PM -0600, Matt Weber wrote:
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/iperf/iperf.hash | 5 +++--
> >  package/iperf/iperf.mk   | 2 +-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
> > index 3540c6e..696085c 100644
> > --- a/package/iperf/iperf.hash
> > +++ b/package/iperf/iperf.hash
> > @@ -1,5 +1,6 @@
> >  # From https://sourceforge.net/projects/iperf2/files/
> > -sha1 909b469bbbc38508cd268e334a6ec319c3116f15        iperf-2.0.12.tar.gz
> > +sha1 3eb21c329af811af53a2c816e1ed26b3dd2c259f        iperf-2.0.13.tar.gz
>
> ERROR: iperf-2.0.13.tar.gz has wrong sha1 hash:
> ERROR: expected: 3eb21c329af811af53a2c816e1ed26b3dd2c259f
> ERROR: got     : 0c7625c61087b9e6866421abb8bb533658b40a8d
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> The hashes shown on https://sourceforge.net/projects/iperf2/files/
> are:
>
> SHA1: 0c7625c61087b9e6866421abb8bb533658b40a8d
> MD5: 31ea1c6d5cbf80b16ff3abe4288dad5e
>

Using my original tarball from the patch development....  it got
swapped as I cut and pasted the sha from the webpage and then checked
it....

# sha1sum dl/iperf/iperf-2.0.13.tar.gz
3eb21c329af811af53a2c816e1ed26b3dd2c259f  dl/iperf/iperf-2.0.13.tar.gz

:-/

Here's the fix, would you mind testing and sending your tested-by?
http://patchwork.ozlabs.org/patch/1030158/

Matt

> The patch was already committed to master. :-/
>
> Greets
> Alex
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)



--

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
