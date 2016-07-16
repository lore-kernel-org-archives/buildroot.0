From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sat, 16 Jul 2016 11:49:05 -0500
Subject: [Buildroot] [PATCH v2] nginx-upload-module: new package
In-Reply-To: <20160716151748.1b901462@free-electrons.com>
References: <1468552217-17318-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20160716151748.1b901462@free-electrons.com>
Message-ID: <CANQCQpa6X5dm1kWE5DNr9=+jD=gApnZ5oYiZgShx2hL=ndmJ-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday, July 16, 2016, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 14 Jul 2016 22:10:17 -0500, Matt Weber wrote:
>> From: Bimal Jacob <Bimal.Jacob@rockwellcollins.com>
>>
>> A module for nginx web server for handling file uploads using
>> multipart/form-data encoding (RFC 1867).
>>
>> Signed-off-by: Bimal Jacob <bimal.jacob@rockwellcollins.com>
>> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
>
> This seems to break the build in certain conditions:
>
>
http://autobuild.buildroot.net/results/64b/64b1bde02346ca67b670f0b095bd3acad707e8cd/build-end.log

Will take a look.

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160716/791fb6f8/attachment.html>
