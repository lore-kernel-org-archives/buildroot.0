From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Sun, 18 Jun 2017 12:50:34 +0530
Subject: [Buildroot] [PATCH v2] board: Add a13_olinuxino Support
In-Reply-To: <CAB0FRsvRrVcGa74QbpsTrAenzpynmh9NjzdHqG1d0MocPchwWg@mail.gmail.com>
References: <1497726908-1702-1-git-send-email-chakra@openedev.com>
 <CAB0FRsvRrVcGa74QbpsTrAenzpynmh9NjzdHqG1d0MocPchwWg@mail.gmail.com>
Message-ID: <CAD6G_RR1LRNEbzo8amDcJpPzbnQ_iVSN=3vzmqAwkEWk9HdyiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jun 18, 2017 at 3:10 AM, Fran?ois Perrad
<francois.perrad@gadz.org> wrote:
>
>
> 2017-06-17 21:15 GMT+02:00 Chakra Divi <2chakrass@gmail.com>:
>>
>> Add initial support for a13_olinuxino board
>> with below features
>> - U-Boot 2017.05
>> - Linux 4.11.5
>> - Default packages from buildroot
>>
>> Signed-off-by: Chakra Divi <chakra@openedev.com>
>> ---
>> Changes for v2:
>> - Add missing readme.txt
>>
>>  .gitlab-ci.yml                           |    1 +
>>  board/olimex/a13_olinuxino/boot.cmd      |    7 +++++
>>  board/olimex/a13_olinuxino/genimage.cfg  |   34 +++++++++++++++++++++++
>>  board/olimex/a13_olinuxino/post-build.sh |    9 ++++++
>>  board/olimex/a13_olinuxino/readme.txt    |   43
>> +++++++++++++++++++++++++++++
>>  configs/olimex_a13_olinuxino_defconfig   |   44
>> ++++++++++++++++++++++++++++++
>>  6 files changed, 138 insertions(+)
>>  create mode 100644 board/olimex/a13_olinuxino/boot.cmd
>>  create mode 100644 board/olimex/a13_olinuxino/genimage.cfg
>>  create mode 100755 board/olimex/a13_olinuxino/post-build.sh
>
>
> I think you could reuse board/olimex/a20_olinuxino/post-build.sh

This post-build script look easier to understand make relevant changes
in future.

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
