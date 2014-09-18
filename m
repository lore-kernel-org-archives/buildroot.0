From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 18 Sep 2014 10:24:12 +0100
Subject: [Buildroot] [PATCH 2/3] iprutils: update patches for the new
 version
In-Reply-To: <5419D5EA.6060602@zacarias.com.ar>
References: <1410974363-43368-1-git-send-email-Vincent.Riera@imgtec.com>
 <1410974363-43368-2-git-send-email-Vincent.Riera@imgtec.com>
 <5419D5EA.6060602@zacarias.com.ar>
Message-ID: <541AA4BC.6040608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/2014 07:41 PM, Gustavo Zacarias wrote:
> On 09/17/2014 02:19 PM, Vicente Olivert Riera wrote:
>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   .../iprutils/iprutils-0001-Don-t-use-gettext.patch |   32 ++++++++++++++++++++
>>   ...low-CFLAGS-to-be-extended-from-the-enviro.patch |   31 +++++++++++++++++++
>>   .../iprutils/iprutils-01-dont-use-gettext.patch    |   30 ------------------
>>   .../iprutils-02-use-environment-cflags.patch       |   20 ------------
>>   4 files changed, 63 insertions(+), 50 deletions(-)
>>   create mode 100644 package/iprutils/iprutils-0001-Don-t-use-gettext.patch
>>   create mode 100644 package/iprutils/iprutils-0002-Allow-CFLAGS-to-be-extended-from-the-enviro.patch
>>   delete mode 100644 package/iprutils/iprutils-01-dont-use-gettext.patch
>>   delete mode 100644 package/iprutils/iprutils-02-use-environment-cflags.patch
>
> Hi.
> The patch updates should be part of the first (bump) patch, otherwise
> it's just an extra commit that fixes breakage because the patches don't
> apply/work.
> It's like adding a new package that needs patches and said patches are
> part of a second patch ("these make it work for real").
> Regards.
>

Fixed. v2 patches sent.

-- 
Vincent
