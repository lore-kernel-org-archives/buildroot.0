From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 4 Sep 2015 09:18:31 +0200
Subject: [Buildroot] [PATCH] pkg-generic: fix <pkg>-legal-info target
In-Reply-To: <55E8D61E.705@mind.be>
References: <217433bd5ec057444b036dd8b72778f078f0926e.1441213919.git.baruch@tkos.co.il>
 <55E85556.4030103@lucaceresoli.net> <20150903143043.GJ18583@tarshish>
 <55E8C75B.5080008@lucaceresoli.net> <55E8D61E.705@mind.be>
Message-ID: <55E945C7.8020507@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
>
>
> On 04-09-15 00:19, Luca Ceresoli wrote:
>> First, why do we have <pkg>-legal-info in 'make help' at all?
>>
>> Arnout, you wrote that line in the help text, after a discussion IIRC.
>> Do you remember a good reason _not_ to remove it?
>
>   I mostly took over what Thomas had put in
> http://patchwork.ozlabs.org/patch/433692
>
>   So no, I see no reason to document <pkg>-legal-info.

Fine, I just sent a patch to remove that line.

-- 
Luca
