From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 Apr 2015 11:19:12 +0900
Subject: [Buildroot] [PATCH v2] pkg-*.mk: add comment about argument 1
	of inner-*-package
In-Reply-To: <20150409143206.0685f0dd@free-electrons.com>
References: <1428581666-20343-1-git-send-email-yamada.masahiro@socionext.com>
 <20150409143206.0685f0dd@free-electrons.com>
Message-ID: <CAK7LNASODoamuetDkfW9hzGzMaUTLt1vV+zqL7KZM20n0d=5Qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

2015-04-09 21:32 GMT+09:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Masahiro Yamada,
>
> On Thu,  9 Apr 2015 21:14:26 +0900, Masahiro Yamada wrote:
>
>> -#  argument 1 is the lowercase package name
>> +#  argument 1 is the lowercase package name, including a host_ prefix
>> +#             for host packages
>
> The prefix is 'host-', not 'host_'. Though I'm not sure this comment is
> really that useful: host-foo is really the name of the package. Since
> there is no parameter containing the lower case package name without
> the 'host-' prefix, I don't think such an additional comment is really
> needed.
>
> The comment is needed for argument 2 and 3, because they are indeed
> different in the fact that one has HOST_ and not the other one.
>
> Best regards,

OK, thanks for explaining this!



-- 
Best Regards
Masahiro Yamada
