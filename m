From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 01 Mar 2013 11:41:52 +0200
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
In-Reply-To: <20130301102400.30a0b4dd@skate>
References: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
 <51304ECC.2020301@gmail.com> <20130301102400.30a0b4dd@skate>
Message-ID: <513077E0.2030209@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, Thomas!

  Thanks for the heads-up! I was a bit lost. :)

On 03/01/2013 11:24 AM, Thomas Petazzoni wrote:
>>   The reason for the patch was to add support for PGM/EPGM protocol
>> in zeromq 2.2.0 library, which is already present in Buildroot.
> Could you send the patch that makes the ZeroMQ change to use the
> openpgm package?

  Which one you mean: the one that uses a pre-packaged openpgm or the
one that uses a separate openpgm?

> Could you send both patches in a small series of two patches? You don't

  I'll do that. The series will have "[PATCH v4 x/2] openpgm: new package"
subject. Is this OK (like, the v3 patch has been appended with an
additional patch but otherwise it's about the same subject)?

--
Best regards,
  Alexander Lukichev
