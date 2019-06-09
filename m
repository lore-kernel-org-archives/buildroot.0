From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 10 Jun 2019 00:47:25 +0200
Subject: [Buildroot] [PATCH 2/2] package/samba4: drop third patch
In-Reply-To: <5772afdf-208c-1276-be70-aa602494acb7@mind.be>
References: <20190609151516.19626-1-fontaine.fabrice@gmail.com>
 <20190609151516.19626-2-fontaine.fabrice@gmail.com>
 <5772afdf-208c-1276-be70-aa602494acb7@mind.be>
Message-ID: <CAPi7W80rMkSMzsG3X+=7o822gGe3WeAgPbGFcbVepd1iKLozUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Le lun. 10 juin 2019 ? 00:39, Arnout Vandecappelle <arnout@mind.be> a ?crit :
>
>  Hi Fabrice,
>
> On 09/06/2019 17:15, Fabrice Fontaine wrote:
> > +     XSLTPROC="False"
>
>  I don't understand why you set this to False instead of false. AFAICS, this
> variable only gets used as an executable to run, it doesn't get evaluated as a
> python expression.
OK, I'll double check that it builds fine with false and send a v2.
>
>  Regards,
>  Arnout
Best Regards,

Fabrice
