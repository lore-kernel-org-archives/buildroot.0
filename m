From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Mar 2013 11:03:02 +0100
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
In-Reply-To: <513077E0.2030209@gmail.com>
References: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
 <51304ECC.2020301@gmail.com> <20130301102400.30a0b4dd@skate>
 <513077E0.2030209@gmail.com>
Message-ID: <20130301110302.65ef6c2c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexander Lukichev,

On Fri, 01 Mar 2013 11:41:52 +0200, Alexander Lukichev wrote:

> On 03/01/2013 11:24 AM, Thomas Petazzoni wrote:
> >>   The reason for the patch was to add support for PGM/EPGM protocol
> >> in zeromq 2.2.0 library, which is already present in Buildroot.
> > Could you send the patch that makes the ZeroMQ change to use the
> > openpgm package?
> 
>   Which one you mean: the one that uses a pre-packaged openpgm or the
> one that uses a separate openpgm?

The one that uses a separate openpgm, since you've submitted it as a
package.

> > Could you send both patches in a small series of two patches? You don't
> 
>   I'll do that. The series will have "[PATCH v4 x/2] openpgm: new package"
> subject. Is this OK (like, the v3 patch has been appended with an
> additional patch but otherwise it's about the same subject)?

That's fine.

[PATCH v4 1/2] openpgm: new package
[PATCH v4 2/2] zeromq: add support to build PGM support

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
