From: Atharva Lele <itsatharva@gmail.com>
Date: Wed, 07 Aug 2019 11:42:53 +0530
Subject: [Buildroot] [PATCH 4/6] autobuild-run: make diffoscope output
 to a JSON-formatted file
In-Reply-To: <20190806214014.52c8839b@windsurf.home>
References: <20190806181251.21885-1-itsatharva@gmail.com>
 <20190806181251.21885-4-itsatharva@gmail.com>
 <20190806214014.52c8839b@windsurf.home>
Message-ID: <1890685.RW2gYeOCcs@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, August 7, 2019 1:10:14 AM IST Thomas Petazzoni wrote:
> Hello Atharva,
> 
> On Tue,  6 Aug 2019 23:42:49 +0530
> 
> Atharva Lele <itsatharva@gmail.com> wrote:
> > Normal diffoscope output is readable by humans but not really
> > convenient when working with it in code. JSON can be easily
> > read and extracted information from.
> > 
> > Signed-off-by: Atharva Lele <itsatharva@gmail.com>
> 
> Peter and I had a look at the diffoscope output, and while the JSON
> version is definitely good for human parsing, having the text version
> in addition for humans to read would also be nice.
> 
> Could you instead store both the JSON and text versions ?
> 

Right yes, Arnout and I discussed this in the meeting yesterday. We also 
decided to limit the size of the text version's output to about 40KB to save 
on server space.

I'll resend with the changes. Thanks for the review!

> Best regards,
> 
> Thomas

Regards,
Atharva Lele
