From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 06 Dec 2013 10:49:37 +0100
Subject: [Buildroot] What is an Acked-by?
In-Reply-To: <CAAXf6LUeDE8+t-zueRcPVuOWRvbUceKaRuSgPTYmpgoFORMcbg@mail.gmail.com>
References: <1386198891-17968-1-git-send-email-thomas.petazzoni@free-electrons.com>	<1386198891-17968-2-git-send-email-thomas.petazzoni@free-electrons.com>	<20131204231952.GI3332@free.fr>	<52A0C223.5040306@mind.be>	<20131205201203.GF3405@free.fr>	<20131205201333.GG3405@free.fr>
 <CAAXf6LUeDE8+t-zueRcPVuOWRvbUceKaRuSgPTYmpgoFORMcbg@mail.gmail.com>
Message-ID: <52A19DB1.4080208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/13 09:03, Thomas De Schampheleire wrote:
> Here we go again... ;-)
>
> On Thu, Dec 5, 2013 at 9:13 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Arnout, All,
>>
>> On 2013-12-05 21:12 +0100, Yann E. MORIN spake thusly:
>>> On 2013-12-05 19:12 +0100, Arnout Vandecappelle spake thusly:
>>>> On 05/12/13 00:19, Yann E. MORIN wrote:
>>>>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>>> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>>>
>>>>   If you've reviewed it and tested it, you would commit it if you had commit
>>>> access, right? So this could actually be an Acked-by, right? Or is my
>>>> understanding of these tags incorrect?
>>>
>>> I'm following the definitions of Documentation/SubmittingPatches in my
>>> Linux kernel tree.
>>>
>>> For example, I refer to:
>>>      Acked-by: does not necessarily indicate acknowledgement of the entire
>>>      patch.
>>>
>>>      Reviewed-by:, instead, indicates that the patch has been reviewed
>>>      and found acceptable according to the Reviewer's Statement
>>>      [--SNIP statement--]
>>>
>>> So, by providing both Reviewed-by and Tested by, I am explicitly stating
>>> that I did a review of the patch, and I tested it. Which, from my
>>> understanding, Acked-by does.
>>
>> ... Acked-by does *not*.
>
> We discussed this on the Buildroot developer day at FOSDEM 2012, see
> the report [1] and addition in the buildroot manual [2]. The manual
> says:
>
> Acked-by: Indicates that the patch can be committed.
> Tested-by: Indicates that the patch has been tested. It is useful but
> not necessary to add a comment about what has been tested.
>
> I must admit that in the mean time it has become common practice to
> also use Reviewed-by, so we'll need to clarify that.
>
> By no means authoritative, but here is what I mean when I add the
> following tags on a patch:
> - Tested-by: as in the manual: I performed some kind of test
> (typically described below the tag) on the patch.
>
> - Reviewed-by: I code-reviewed the patch and did my best in spotting
> problems, but I am not sufficiently familiar with the area touched to
> provide an Acked-by. This means that, although I reviewed the patch,
> there may be remaining problems that would be spotted by someone with
> more experience in that area. The detection of such problems should
> not mean that my Reviewed-by: was too hasty.
>
> - Acked-by: I code-reviewed the patch (note: not necessarily tested)
> and am familiar enough with the area touched that I can indicate it is
> a good patch. If someone else detects a serious problem with this
> patch afterwards, then this Acked-by may have been too hasty.

  If this text makes it into the documentation, it gets my
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
:-)


  Now I do think I understand why Yann didn't give an Ack, but just a 
Reviewed: he doesn't feel familiar enough with the infrastructure to be 
really sure the patch is OK.

  You could also say: with Acked-by you are prepared to share the blame 
if something is wrong with the patch, with Reviewed-by you're not.

  Regards,
  Arnout


> So for me, Acked-by is stronger than Reviewed-by, but orthogonal to Tested-by.
>
> Note that my definition of Acked-by does not really rely on 'module
> owners', contrary to how Yann interprets it. For example in the case
> of the core infrastructure I don't believe that only ThomasP can
> provide an Acked-by. Several developers other than ThomasP have made
> good changes there, and are thus sufficiently knowledgeable to
> indicate their Ack. In my opinion, it is up to the maintainer to
> assess the weight of an Ack. He is free to wait until an ack by
> ThomasP, or not.


> (for the record: with the above I do not want to minimize ThomasP's
> contribution in this area, not at all. His work has been and is of
> great importance for the buildroot project, and I deeply respect it
> (and him)
>
> Best regards,
> Thomas
>
> [1] http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html
> [2] http://buildroot.uclibc.org/downloads/manual/manual.html#_reviewing_testing_patches
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
