From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 4 Jun 2019 14:03:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: needs threads
In-Reply-To: <20190604090727.36a7bd01@windsurf>
References: <20190603195926.3684-1-fontaine.fabrice@gmail.com>
 <20190604090727.36a7bd01@windsurf>
Message-ID: <7334d161-b511-0c5c-41c3-31815d0da988@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 04/06/2019 ? 09:07, Thomas Petazzoni a ?crit?:
> Hello,
> 
> On Mon,  3 Jun 2019 21:59:26 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> Fixes:
>>   - http://autobuild.buildroot.org/results/813e8951530c093f46b38bf8c3b467ab6535c95b
>>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
>  From a very quick glance at the code and a quick build test, the
> <pthread.h> include doesn't seem to be necessary. Perhaps it should
> simply be removed ?

Indeed, you are right.

If needed, I can send the patch upstream.
I've already updated this on my local branch [1]
and the build is now OK:

- br-arm-full-nothread [1/1]: OK

Thanks,

[1] - 
https://github.com/texierp/buildroot/commit/452941dd7a225e25ef16f71119b277f69eb6ec66
-- 
Best regards,
Pierre-Jean Texier
