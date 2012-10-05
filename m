From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 5 Oct 2012 14:55:22 -0300
Subject: [Buildroot] [PATCHv2][RESEND] python-protobuf: Add support for
 Python implementation of Google's Protocol Buffers
In-Reply-To: <505B8D42.8010108@mind.be>
References: <20120917105103.GA17573@localhost.comm5.com.br>
 <20120920223439.6480353a@skate> <505B8D42.8010108@mind.be>
Message-ID: <CAExDhvZCmV9Wobjt56sa0MFC0rah8Zt_0=JjvKpaimaVyv2cVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


     Somehow I missed your replies. I will resubmit with the changes
suggested. Thanks.


Kind Regards,
      Thiago A. Correa

On Thu, Sep 20, 2012 at 6:40 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 09/20/12 22:34, Thomas Petazzoni wrote:
>>>
>>> >  +PYTHON_PROTOBUF_VERSION = $(PROTOBUF_VERSION)
>>> >  +PYTHON_PROTOBUF_SOURCE  = $(PROTOBUF_SOURCE)
>>> >  +PYTHON_PROTOBUF_SITE    = $(PROTOBUF_SITE)
>>
>> So the source tarball is the same? So what you're doing here in fact is
>> having two separate Buildroot packages for the same source tarball,
>> something that we generally don't do. But in this case, it seems like
>> logical to do it this way.
>>
>> What do others think about this strategy?
>>
>
>  It's a good start, but I still think we need more generic infrastructure
> for this use case.  For instance, this will fail if protobuf moves to a
> hg version, because then PROTOBUF_SOURCE is empty.
>
>  For the time being, it's OK, however.
>
>  Regards,
>  Arnout
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
