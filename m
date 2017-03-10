From: Julien Boibessot <julien.boibessot@free.fr>
Date: Fri, 10 Mar 2017 16:31:24 +0100
Subject: [Buildroot] [PATCH] package/liberation: fixes download site due
 to recent fedorahosted.org closing
In-Reply-To: <8760jh9rq8.fsf@dell.be.48ers.dk>
References: <1489151966-972-1-git-send-email-julien.boibessot@free.fr>
 <8760jh9rq8.fsf@dell.be.48ers.dk>
Message-ID: <6032b19a-5974-a699-bab2-b254356d3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Re Peter,

On 10/03/2017 14:38, Peter Korsgaard wrote:
>>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:
>  > From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
>
> Committed, thanks.
>
> We have some other packages also using fedorahosted.org. Will you send
> fixes for those as well, please?
>
> git grep fedorahosted package/**/*.mk
> package/ding-libs/ding-libs.mk:DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot
> package/dropwatch/dropwatch.mk:DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot
> package/elfutils/elfutils.mk:ELFUTILS_SITE = https://fedorahosted.org/releases/e/l/elfutils/$(ELFUTILS_VERSION)
> package/iptraf-ng/iptraf-ng.mk:IPTRAF_NG_SITE = https://fedorahosted.org/releases/i/p/iptraf-ng

I wasn't able to find official websites/git repos for ding-libs,
dropwatch nor iptraf-ng, sorry :-(

Regards,
Julien
