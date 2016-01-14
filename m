From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jan 2016 14:20:34 +0100
Subject: [Buildroot] argp-standalone broken when optimization is enabled
In-Reply-To: <CAAMcf8CKZ+ZFbTgTgdkWGMSiV4Xitnb-PpzsZeOSs800O9ieQA@mail.gmail.com>
References: <CAAMcf8C=SMLHGaz0aYy3A+xDA0fDNkncW5=J6KE-K8X8dYeLsQ@mail.gmail.com>
 <20160114101914.36da8560@free-electrons.com>
 <CAAMcf8AcZzNpGrvfOaGO-EBPZHfyzojNsKusZr2RuEfC9xE+iw@mail.gmail.com>
 <20160114115735.079123f4@free-electrons.com>
 <CAAMcf8CKZ+ZFbTgTgdkWGMSiV4Xitnb-PpzsZeOSs800O9ieQA@mail.gmail.com>
Message-ID: <20160114142034.35adff54@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicen?,

On Thu, 14 Jan 2016 12:54:40 +0100, Vicen? wrote:

> I can confirm that
> http://review.gluster.org/changes/6034/revisions/b2dfa011a3fdcb7d22764d143517d0fbd1c2a201/patch?zip
> works fine.
> It just needs to tweak the file paths.
> And it is a proper solution, indeed better than just disabling optimizations.

Thanks. Then can you send a patch adding this patch to the Buildroot
argp-standalone package ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
