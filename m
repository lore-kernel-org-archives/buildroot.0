From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Oct 2019 20:42:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/meson: import lzma only when
 needed
In-Reply-To: <n8cr7gxdql.ln2@ID-313208.user.individual.net>
References: <20191019080324.7303-1-bernd.kuhls@t-online.de>
 <n8cr7gxdql.ln2@ID-313208.user.individual.net>
Message-ID: <3893cdf8-de5f-e11c-0462-113f5041ff7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/10/2019 14:30, Bernd Kuhls wrote:
> Am Sat, 19 Oct 2019 10:03:24 +0200 schrieb Bernd Kuhls:
> 
>> +Fixes https://github.com/mesonbuild/meson/issues/6012
> 
> Patch was committed by upstream:
> https://github.com/mesonbuild/meson/commit/998a1f5fa3f7e86ce3902544bc61f54c9709926b

 Unfortunately I didn't see this and I took the effort of writing a decent
commit message for the patch.

 Anyway, applied to master, thanks.

 Regards,
 Arnout
