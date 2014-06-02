From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 3 Jun 2014 02:26:35 +0400
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: add ordering
	prefix to patches
In-Reply-To: <20140602235742.0d164e8a@free-electrons.com>
References: <1401745306-2162-1-git-send-email-jcmvbkbc@gmail.com>
 <1401745306-2162-2-git-send-email-jcmvbkbc@gmail.com>
 <20140602235742.0d164e8a@free-electrons.com>
Message-ID: <CAMo8Bf+_vaBMSmtxk-6nK91+kgn=rbb=gfnSCpWu1odRurpxsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 3, 2014 at 1:57 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Max Filippov,
>
> On Tue,  3 Jun 2014 01:41:45 +0400, Max Filippov wrote:
>
>>  ...ps.patch => 100-xserver_xorg-server-mips.patch} |    0
>>  ...-xserver_xorg-server-add-support-for-arc.patch} |    0
>>  2 files changed, 0 insertions(+), 0 deletions(-)
>>  rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-mips.patch => 100-xserver_xorg-server-mips.patch} (100%)
>>  rename package/x11r7/xserver_xorg-server/{xserver_xorg-server-add-support-for-arc.patch => 200-xserver_xorg-server-add-support-for-arc.patch} (100%)
>
> The new names do not comply with the documentation, the naming
> convention is:
>         <packagename>-<sequencenumber>-<description>.patch

Must be some previous version that I remembered ):

-- 
Thanks.
-- Max
