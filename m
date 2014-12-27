From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sat, 27 Dec 2014 18:01:14 +0100
Subject: [Buildroot] [PATCH 1/2] libvncserver: bump version to 0.9.10
In-Reply-To: <20141227145230.76abeade@free-electrons.com>
References: <1419554775-11560-1-git-send-email-bos@je-eigen-domein.nl>
 <20141227145230.76abeade@free-electrons.com>
Message-ID: <549EE5DA.30003@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/27/2014 02:52 PM, Thomas Petazzoni wrote:
> Dear Floris Bos,
>
> On Fri, 26 Dec 2014 01:46:14 +0100, Floris Bos wrote:
>> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
>> ---
>>   .../libvncserver-0001-CVE-2014-6051-6052.patch     |  85 ------------
>>   .../libvncserver-0002-CVE-2014-6053.patch          |  21 ---
>>   .../libvncserver-0003-CVE-2014-6054.patch          |  87 ------------
>>   .../libvncserver-0004-CVE-2014-6055.patch          | 150 ---------------------
>>   package/libvncserver/libvncserver.mk               |   5 +-
>>   5 files changed, 3 insertions(+), 345 deletions(-)
>>   delete mode 100644 package/libvncserver/libvncserver-0001-CVE-2014-6051-6052.patch
>>   delete mode 100644 package/libvncserver/libvncserver-0002-CVE-2014-6053.patch
>>   delete mode 100644 package/libvncserver/libvncserver-0003-CVE-2014-6054.patch
>>   delete mode 100644 package/libvncserver/libvncserver-0004-CVE-2014-6055.patch
> This patch is causing a bunch of new build failures, like:
>
> http://autobuild.buildroot.org/results/75a/75afaad317264fb3cca80fe82cfc5a786f7e42a3/build-end.log
>
> Can you look into this and fix it?

Doesn't get along with the version of libva shipped with buildroot.
Will send in a patch that disables that.
(not using libva myself, so did not notice)


Yours sincerely,

Floris Bos
