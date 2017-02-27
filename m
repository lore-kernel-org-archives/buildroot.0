From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 27 Feb 2017 08:43:40 -0300 (BRT)
Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
In-Reply-To: <8c9bf0e5-d389-e61c-efc8-8e75da9bc423@mind.be>
References: <1485179476-6049-1-git-send-email-casantos@datacom.ind.br>
 <1485971468-3709-1-git-send-email-casantos@datacom.ind.br>
 <373030528.10239603.1487071200627.JavaMail.zimbra@datacom.ind.br>
 <8c9bf0e5-d389-e61c-efc8-8e75da9bc423@mind.be>
Message-ID: <1102446308.12330639.1488195820399.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Carlos Santos" <casantos@datacom.ind.br>, buildroot at buildroot.org
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Thursday, February 16, 2017 8:08:17 PM
> Subject: Re: [Buildroot] [PATCH v2] python-lxml: allow build as host package

> On 14-02-17 12:20, Carlos Santos wrote:
>>> From: "Carlos Santos" <casantos@datacom.ind.br>
>>> To: buildroot at buildroot.org
>>> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
>>> Sent: Wednesday, February 1, 2017 3:51:08 PM
>>> Subject: [Buildroot] [PATCH v2] python-lxml: allow build as host package
>> 
>>> While currently there is no in-tree Buildroot package which depends on
>>> host-python-lxml, we (DATACOM) have some proprietary modules that use it
>>> in their test scripts.
>>>
>>> We tested python-lxml as host package and confirmed that it builds and
>>> works correctly. Someone else might require it, so we are proposing its
>>> inclusion.
>> 
>> Hello,
>> 
>> Any news about this proposal? I think it could fall into the new policy of
>> "loosen up a little on accepting host tools"[1] if I add the corresponding
>> Config.in.host, right? I know I'm pushing here, but host-python-lxml would
>> help us (DATACOM) to have more reproducible builds.
>> 
>> 1.
>> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2017#Host_packages_with_no_in-tree_user
> 
> We didn't reach a satisfactory conclusion for this case. We (or at least I :-)
> certainly understand your need. But it is really weird to see a completely
> random python package appear in the host tools menu. I personally don't mind
> that much, but if all 265 host packages would appear in the menu it would get a
> little bit overloaded...
> 
> *Some* way to include it in the autobuilders is certainly needed. As written in
> the report: "Maybe for these it's not even so important that they are tested in
> the autobuilder - almost nobody is going to use it anyway. However, in that case
> it's not very useful to have it anyway. Especially because it almost certainly
> will break at some point. "
> 
> So, no clear answer I'm afraid...

Hello,

Could we have a verdict on this, please?

   http://patchwork.ozlabs.org/patch/722644/

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
