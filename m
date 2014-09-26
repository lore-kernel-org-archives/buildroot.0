From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 26 Sep 2014 12:48:13 +0200
Subject: [Buildroot] [PATCH 23/23 v5] docs/manual: document the asciidoc
	infra
In-Reply-To: <20140925222108.GC4184@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <cace268e0a2d0419476bc7c1952f753857a863a3.1410692671.git.yann.morin.1998@free.fr>
 <CAAXf6LW17bqSDpz_Jksqx5cm-KJ+_PRsgANKE_zotCU1gtmT5A@mail.gmail.com>
 <20140925222108.GC4184@free.fr>
Message-ID: <CAAXf6LUSFpZ1ya-+FEuccQEu1qeEdHPSEZBpkKr3=eg1Uvrnkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, Sep 26, 2014 at 12:21 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-09-24 22:07 +0200, Thomas De Schampheleire spake thusly:
>> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > +* +HTML+
>> > +* +SPLIT_HTML+
>> > +* +PDF+
>> > +* +EPUB+
>> > +* +TEXT+
>>
>> Any reason why this is capitalized and underscored like they were variables?
>> There is nowhere a variable FOO_SPLIT_HTML_BAR, is there?
>
> Yup, I'll set it to lowercase: they are the types of documents we
> generate. That it needs to be in caps in variables is just a naming
> convention.
>
>> In fact, as far as I can see, the variables that should use them use
>> them as follows:
>>
>> FOO_EXTRA_CHECK_DEPENDENCIES_split-html_HOOKS
>>
>> no?
>
> Right. This is a bug. For _HOOKS variables in all package infras, we
> exclusively use uppercase. So should we do here, too.
>
> However, as you noticed, this is not correctly handled. I'll fix before
> I repsin the series.

Ok, that's indeed more in line with all the other infras.

>
> Thomas DS, also known as Lynx Eye! ;-)

hehe :)

>
>> And related to that: the above is not in line with the variable
>> $(2)_$(4)_ASCIIDOC_OPTS where $(4) is used instead of $(5).
>>
>> The above two comments, if needed, are of course to be fixed in earlier patches.
>
> Right.
>
>> > +* +FOO_EXTRA_CHECK_DEPENDENCIES_HOOKS+ to run additional tests on required
>> > +  components to generate the document. In AsciiDoc, it is possible to
>> > +  call filters, that is, programs that will parse an AsciiDoc block and
>>
>> My feeling says to loose the comma after 'that is' but I'm no native
>> English writer.
>
> Neither am I. Still, I believe that's the way it is used. For example:
>     https://en.wikipedia.org/wiki/Comma#Between_adjectives
>
> Title is unrelated to the subject, but the sentence uses a comma after
> "that is".
>
> See also:
>     http://www.thefreedictionary.com/that+is
>
> Quoting from two places:
>     To explain more clearly; in other words: on the first floor, that
>     is, the floor at street level.
>
>     When that introduces a relative clause, the clause is usu.
>     restrictive, that is, essential to the complete meaning of the
>     sentence.
>

Ok, I agree, keep the comma.

> Hmm... Sure thing, we learn a great deal of English on the Buildroot
> mailing list. What was the last argument we had some time ago? hehe! :-)

:)


Best regards,
Thomas
