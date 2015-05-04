From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Mon, 4 May 2015 10:05:15 -0500
Subject: [Buildroot] 2015.08 release goals
In-Reply-To: <20150504164841.40856c60@free-electrons.com>
References: <20150503115354.2fc19b90@free-electrons.com>
 <CAMQcK5JYGAkJT0y9VCHdEQiBA8AWaojpSqdKYYD4jHjNUKxvMg@mail.gmail.com>
 <20150504163010.188f3ef5@free-electrons.com>
 <CAMQcK5+DtuXQRSx4W7GhbpxBxy12H9f1PNYGMLuFpyCbTm4RGQ@mail.gmail.com>
 <20150504164841.40856c60@free-electrons.com>
Message-ID: <CAMQcK5L2gyMfXMEJMx3+Xntny7CNwajNv5sT-OpTKZq8_9oDcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, May 4, 2015 at 9:48 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Ryan,
>
> On Mon, 4 May 2015 09:45:59 -0500, Ryan Barnett wrote:
>
>> > Have you been able to work with upstream about the Python stuff?
>>
>> We no longer are doing the "Python stuff" in the audit package - which
>> is what you are referring to here.
>
> Yes, exactly. So what was the solution to overcome the
> cross-compilation issue of the upstream audit logic?

We have a patch that is based on
https://www.redhat.com/archives/linux-audit/2012-November/msg00000.html

More detail will be provided when v5 of the patchset is sent out in
the next week or two.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
