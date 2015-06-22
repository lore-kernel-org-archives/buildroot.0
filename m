From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Jun 2015 16:21:13 -0500
Subject: [Buildroot] [PATCH 1/1] protobuf: bump version to 2.6.1
In-Reply-To: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
References: <1434995939-8236-1-git-send-email-george.redivo@datacom.ind.br>
Message-ID: <CANQCQpYy-kuZLfMjO0YrX8Kfa25eLUa09U-NUyOSQjxE0vq5WA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

George,

On Mon, Jun 22, 2015 at 12:58 PM, George Redivo <
george.redivo@datacom.ind.br> wrote:

> * Adds powerpc architecture support
>

FYI, there is an old email thread related to a previous attempt at bumping
where any compiler older then GCC4.7 has build issues with atomics.
http://lists.busybox.net/pipermail/buildroot/2014-October/110418.html

There was also some discussion at one of the previous Buildroot developer
meetings about the direction suggested  for handling this case.  I was
leaning towards just restricting based on toolchain version.....

Thanks,

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150622/376f0f4c/attachment.html>
