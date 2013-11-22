From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Nov 2013 11:42:43 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20131122091411.59d82eb5@skate>
References: <20131122073003.1B835101305@stock.ovh.net>
 <20131122091411.59d82eb5@skate>
Message-ID: <CAAXf6LVb6KPe3xPG-Oia6O8NtJ64uD7oNrP4VXS3SM7cpkWe5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for the analysis!

On Fri, Nov 22, 2013 at 9:14 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
[..]
>>   mips64el |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/bcff4b81bfbb1191f97317b0945c74d948c9774b/
>
> checking whether to build with BeeCrypt library... no
> configure: error: mandatory BeeCrypt library not found
> make: *** [/home/test/test/3/output/build/rpm-5.2.0/.stamp_configured] Error 1
>
> rpm has a dependency on beecrypt, so normally it should have been built
> before. Seems like rpm isn't "seeing" that beecrypt is around :-)

I will look into this...

Best regards,
Thomas
